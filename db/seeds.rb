# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'random_data'

# Create Users
5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

 # Create Wikis
 50.times do
   Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
 end
 wikis = Wiki.all
  #Create a premium user
  premium = User.create!(
    name:     'Premium User',
    email:    'premium@example.com',
    password: 'hellowworld',
    role:     'premium'
  )

  # Create an admin user
  admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )

  # Create a standard
  standard = User.create!(
    name:     'Standard User',
    email:    'standard@example.com',
    password: 'helloworld',
    role:     'premium'
  )



 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
