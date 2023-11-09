FactoryBot.define do
  factory :combat_rating_param do
    star_destroyer_version { "MyString" }
    tie_squadrons { 1 }
    turbolasers { 1 }
    ion_cannons { 1 }
  end
end
