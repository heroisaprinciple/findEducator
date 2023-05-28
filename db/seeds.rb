# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create!(name: 'React', redirect_uri: '', scopes: '')
end

User.find_or_create_by(email: 'valcat552@gmail.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.role = User.roles[:admin]
  user.first_name = 'Ari'
  user.last_name = 'Sof'
end

User.find_or_create_by(email: 'all@gmail.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.role = User.roles[:user]
  user.first_name = 'All'
  user.last_name = 'Jackson'
end

subjects = ['Mathematics', 'Physics', 'Chemistry', 'Biology', 'Computer Science']

subjects.each do |subject_name|
  Subject.find_or_create_by(name: subject_name)
end