# frozen_string_literal: true

require 'benchmark'
require 'factory_bot'

class StarDestroyerRaterProfiler
  def self.run
    # Avoid wasting time logging SQL and other details we don't need
    ActiveRecord::Base.logger.level = Logger::INFO

    ActiveRecord::Base.transaction do
      build_test_data(star_destroyer_count: 50)

      # Build this here outside the profiling, so the only thing we do below
      # is run the slow code. If the class' init is slow that may be something
      # else to look into, but we're only concerned with the processing right
      # now.
      rater = StarDestroyerRater.new

      begin
        profile = StackProf.run(mode: :cpu, interval: 1000, raw: true) do
          seconds = Benchmark.realtime do
            StarDestroyer.all.each do |star_destroyer|
              rater.rate(star_destroyer)
            end
          end
        ensure
          puts "The method took #{seconds.truncate(2)} seconds."
        end
      ensure
        File.write('tmp/stackprof/star_destroyer_rater_perf.json', JSON.generate(profile))
      end

      # Don't persist any model changes
      raise ActiveRecord::Rollback
    end
  rescue ActiveRecord::Rollback
    # Ignored
  end

  def self.build_test_data(star_destroyer_count: 100)
    FactoryBot.create_list(:star_destroyer, star_destroyer_count)
    StarDestroyer::CLASSES.each do |klass|
      FactoryBot.create(:combat_rating_param, star_destroyer_version: klass)
      FactoryBot.create(:interdiction_rating_param, star_destroyer_version: klass)
      FactoryBot.create(:jump_rating_param, star_destroyer_version: klass)
    end
  end
end

StarDestroyerRaterProfiler.run
