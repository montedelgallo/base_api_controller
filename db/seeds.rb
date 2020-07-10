# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Running Seed'
50.times do
  Post.create(
    title: Faker::Quote.famous_last_words,
    body: Faker::Lorem.words(number: 12).join(' ') + Faker::Lorem.multibyte
  )
end

50.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.within(range: 18..100),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state
  )
end
puts 'Done'
