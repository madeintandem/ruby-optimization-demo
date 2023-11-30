FactoryBot.define do
  factory :combat_rating_param do
    star_destroyer_version { StarDestroyer::CLASSES.sample }
    tie_squadrons { Faker::Number.within(range: 5..50) }
    turbolasers { Faker::Number.within(range: 25..100) }
    ion_cannons { Faker::Number.within(range: 10..50) }
  end
end
