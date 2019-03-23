# require 'faker'

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
##################################################################
I18n.reload!

###### this is super user (admin and devellopper) ##########
  User.create!( first_name: "first_name",
                last_name: "last_name",
                nick_name: "my_name_is_god",
                avatar_url: "",
                phone: "01 47 20 00 01",
                is_god: true,
                email: "thp.sess7.gre@gmail.com",
                password: "azeaze"
                )
#################################################
Category.create!(name: "break")
Category.create!(name: "locking")
Category.create!(name: "popping")
Category.create!(name: "house dance")
Category.create!(name: "hip hop new style")
Category.create!(name: "krump")
Category.create!(name: "voguing")
Category.create!(name: "toprock")

# on peut passer `confirmed_at: Time.now` pour confirmer tes users dans le seed si on a confirmation par email dans devise
# 10.times do |u|
#   u = User.create!(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   nick_name: Faker::ElectricalComponents.unique.active,
#   avatar_url: "",
#   phone: "01 47 20 00 01",
#   is_god: false,
#   email: "teamgre38#{u}@yopmail.com",
#   password: "123456"
#   )
#   puts "User #{u.first_name}"
# end
# 10.times do |u|
#   u = User.create!(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   nick_name: Faker::ElectricalComponents.unique.active,
#   avatar_url: "",
#   phone: "01 47 20 00 01",
#   is_god: false,
#   email: "teamgre38#{u}@yopmail.com",
#   password: "123456"
#   )
#   puts "User #{u.first_name}"
# end


# on peut passer `confirmed_at: Time.now` pour confirmer tes users dans le seed si on a confirmation par email dans devise
# 10.times do |u|
#   u = User.create!(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   nick_name: Faker::ElectricalComponents.unique.active,
#   avatar_url: "",
#   phone: "01 47 20 00 01",
#   is_god: false,
#   email: "teamgre38#{u}@yopmail.com",
#   password: "123456"
#   )
#   puts "User #{u}"
# end

# 10.times do |e|
#   e = Event.create!(
#   name: Faker::Music::RockBand.name,
#   description: Faker::Restaurant.description[20..1000],
#   address: Faker::Address.street_address,
#   zipcode: Faker::Address.zip_code,
#   city_name: Faker::Address.city,
#   latitude: Faker::Address.latitude,
#   longitude: Faker::Address.longitude,
#   start_date: Faker::Date.between(DateTime.now + 1 , DateTime.now + 2),
#   duration: 10,
#   spectator_price: rand(5..10),
#   dancer_price: rand(10..20),
#   rules: "En gros c'est 2 mecs qui se battent en duel de danse",
#   prize_money: "30€ de bons d'achat a Auchan",
#   picture_url: "",
#   promoter_id: User.all.sample.id,
#   )
#   puts " Event #{e.name}"
# end


# 20.times do |r|
#   r = Registration.create!(
#     user_id: User.all.sample.id,
#     event_id: Event.all.sample.id,
#     role: ["dancer", "spectator"].sample
#   )
#   puts "Registration #{r.role}"
# end

# 10.times do |c|
#   c = Category.create!(
#     name: Faker::Music.genre
#   )
#   puts "Category #{c.name}"
# end

# 20.times do |ca|
#   ca = CategoryEvent.create!(
#     category_id: Category.all.sample.id,
#     event_id: Event.all.sample.id
#   )
#   puts "CategoryEvent #{ca}"
# end








