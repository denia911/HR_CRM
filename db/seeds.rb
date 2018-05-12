5.times do
  password = Faker::Internet.password
  User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
end

5.times do
  company = Company.create(name: Faker::Name.name, description: Faker::Lorem.sentence)
  5.times do
    company.workers.create(name: Faker::Name.name, description: Faker::Lorem.sentence)
  end
end
