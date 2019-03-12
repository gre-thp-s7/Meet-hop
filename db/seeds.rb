# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Registration.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('registrations')



10.times do |u|
  u = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nick_name: "bob",
  avatar_url: "",
  phone: "01 47 20 00 01",
  is_god: false
  )
end

10.times do |e|
  e = Event.create!(
  name: Faker::Nation.nationality,
  description: Faker::Restaurant.description,
  start_date: Faker::Date.between(DateTime.now, DateTime.now + 1),
  duration: rand(10),
  spectator_price: "trop cher",
  rules: "En gros c'est 2 mecs qui se battent en duel de danse",
  prize_money: "30€ de bons d'achat a Auchan",
  picture_url: "",
  promoter_id: User.all.sample.id
  )
end


20.times do |r|
  r = Registration.create!(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    role: "danceur ou spectateur"
  )
end
