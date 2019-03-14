# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


################### these lignes clear the DB ##############@
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Registration.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('registrations')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
CategoryEvent.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_events')
Locality.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('localities')
##################################################################


###### this is super user (admin and devellopper) ##########
  User.create!(
  first_name: "first_name",
  last_name: "last_name",
  nick_name: "my_name_is_god",
  avatar_url: "",
  phone: "01 47 20 00 01",
  is_god: true,
  email: "thp.sess7.gre@gmail.com",
  password: "azeaze"
  )
#################################################  

10.times do |u|
  u = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nick_name: Faker::ElectricalComponents.unique.active,
  avatar_url: "",
  phone: "01 47 20 00 01",
  is_god: false,
  email: Faker::Internet.email,
  password: "123456"
  )
end

10.times do |l|
  l = Locality.create!(
    city_name: Faker::House.room,
    zipcode: "38330 en force",
    address: "rue de la poupée qui tousse"
  )
end

3.times do |e|
  e = Event.create!(
  name: Faker::Nation.nationality,
  description: Faker::Restaurant.description[20..1000],
  start_date: Faker::Date.between(DateTime.now + 1 , DateTime.now + 2),
  duration: 10,
  spectator_price: "trop cher",
  rules: "En gros c'est 2 mecs qui se battent en duel de danse",
  prize_money: "30€ de bons d'achat a Auchan",
  picture_url: "",
  promoter_id: User.all.sample.id,
  locality_id: Locality.all.sample.id
  )
end


20.times do |r|
  r = Registration.create!(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    role: "danceur ou spectateur"
  )
end

10.times do |c|
  c = Category.create!(
    name: Faker::Restaurant.name
  )
end

20.times do |ca|
  ca = CategoryEvent.create!(
    category_id: Category.all.sample.id,
    event_id: Event.all.sample.id
  )
end
