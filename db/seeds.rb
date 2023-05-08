# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.first_or_create(email: 'valcat552@gmail.com', password: 'password',
                     password_confirmation: 'password', role: User.roles[:admin],
                     firstname: 'Ari', lastname: 'Sof', phone: '0871234567')


Subject.create(name: 'Mathematics')
Subject.create(name: 'Physics')
Subject.create(name: 'Chemistry')
Subject.create(name: 'Biology')
Subject.create(name: 'Computer Science')