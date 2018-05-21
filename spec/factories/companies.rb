FactoryBot.define do
  factory :company do
    name { Faker::HarryPotter.character }
    description { Faker::Lorem.word }
  end
end
