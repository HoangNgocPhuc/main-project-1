# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Gin",
             email: "darkdragon236@gmail.com",
             password:              "tthanhuetn01",
             password_confirmation: "tthanhuetn01",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
36.times do
  rd = Random.new  
  weight = rd.rand(50..90).to_s
  height = rd.rand(140..170).to_s
  bmi = rd.rand(1.5..3.0)
  users.each { |user| user.healths.create!(height: height, weight: weight, bmi: bmi) }
end