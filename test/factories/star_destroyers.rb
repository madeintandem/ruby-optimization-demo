# frozen_string_literal: true

FactoryBot.define do
  factory :star_destroyer do
    name { "#{Faker::Hipster.word}-#{Faker::Hipster.word}" }
    version { StarDestroyer::CLASSES.sample }
    jump_rating { 0 }
    combat_rating { 0 }
    interdiction_rating { 0 }
  end
end
