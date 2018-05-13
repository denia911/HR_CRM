FactoryBot.define do
  factory :worker do
    name { Faker::StarWars.character }
    description { Faker::Lorem.word }
    company_id nil
  end
end
