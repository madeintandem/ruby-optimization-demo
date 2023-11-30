FactoryBot.define do
  factory :jump_rating_param do
    star_destroyer_version { StarDestroyer::CLASSES.sample }
    motivator_power { Faker::Number.within(range: 25.0..250.0) }
    cronau_factor { Faker::Number.within(range: 5.0..10.0) }
    mass_shadow { Faker::Number.within(range: 17.0..73.0) }
  end
end
