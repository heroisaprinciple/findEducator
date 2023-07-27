# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create!(email: 'admin@gmail.com') do |user|
  user.password = 'LmK12$14rEt,'
  user.password_confirmation = 'LmK12$14rEt,'
  user.role = User.roles[:admin]
  user.first_name = 'Admin'
  user.last_name = 'Admin'
end

User.create!(email: 'all@gmail.com') do |user|
  user.password = 'NmK12$14rEt,'
  user.password_confirmation = 'NmK12$14rEt,'
  user.role = User.roles[:user]
  user.first_name = 'All'
  user.last_name = 'Jackson'
end

categories = ['Mathematics', 'Physics', 'Chemistry', 'Biology', 'Computer Science']

categories.each do |category_name|
  Category.create!(name: category_name)
end

Subject.create!(name: 'Advanced Mathematics', category_id: 1)
Subject.create!(name: 'Cell Biology', category_id: 4)
Subject.create(name: 'Thermodynamics', category_id: 2)

Mentor.create!(email: 'baker@gmail.com') do |mentor|
  mentor.password = 'RmK12$14rEt,'
  mentor.password_confirmation = 'RmK12$14rEt,'
  mentor.first_name = 'Sunny'
  mentor.last_name = 'Baker'
  mentor.occupation = 'Cell Biologist'
  mentor.subject_id = 2
end

Mentor.create!(email: 'randy@gmail.com') do |mentor|
  mentor.password = 'XmK12$14rEt,'
  mentor.password_confirmation = 'XmK12$14rEt,'
  mentor.first_name = 'Maria'
  mentor.last_name = 'Randy'
  mentor.occupation = 'Thermodynamics Scientist'
  mentor.subject_id = 3
end

