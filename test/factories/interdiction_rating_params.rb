FactoryBot.define do
  factory :interdiction_rating_param do
    star_destroyer_version { StarDestroyer::CLASSES.sample }
    gravity_engines { Faker::Number.within(range: 0..8) }
    max_mass_shadow { Faker::Number.within(range: 17.0..73.0) }
    power_drain { Faker::Number.within(range: 1.0..67.0) }
  end
end
