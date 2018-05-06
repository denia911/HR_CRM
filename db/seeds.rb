5.times do
  password = Faker::Internet.password
  user = User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
  5.times do
  company = user.companies.create(name: Faker::Name.name, description: Faker::Lorem.sentence)
    5.times do
    company.workers.create(name: Faker::Name.name, description: Faker::Lorem.sentence)
    end
  end
end