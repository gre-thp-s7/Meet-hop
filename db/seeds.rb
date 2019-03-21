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
Locality.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('localities')
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
Category.create!(name: "krump")
Category.create!(name: "voquing")
Category.create!(name: "boogaloo")
Category.create!(name: "smurf")
Category.create!(name: "hype")
Category.create!(name: "uprock")




# # on peut passer `confirmed_at: Time.now` pour confirmer tes users dans le seed si on a confirmation par email dans devise
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

# 10.times do |l|
#   l = Locality.create!(
#     city_name: Faker::House.room,
#     zipcode: "38330 en force",
#     address: "rue de la poupée qui tousse"
#   )
#   puts "Locality #{l}"
# end

# 10.times do |e|
#   e = Event.create!(
#   name: Faker::Lorem.characters(10),
#   description: Faker::Restaurant.description[20..1000],
#   start_date: Faker::Date.between(DateTime.now + 1 , DateTime.now + 2),
#   duration: 10,
#   spectator_price: rand(5..10),
#   dancer_price: rand(10..20),
#   rules: "En gros c'est 2 mecs qui se battent en duel de danse",
#   prize_money: "30€ de bons d'achat a Auchan",
#   picture_url: "",
#   promoter_id: User.all.sample.id,
#   locality_id: Locality.all.sample.id
#   )
#   puts " Event #{e}"
# end


# 20.times do |r|
#   r = Registration.create!(
#     user_id: User.all.sample.id,
#     event_id: Event.all.sample.id,
#     role: ["dancer", "spectator"].sample
#   )
#   puts "Registration #{r}"
# end

# 10.times do |c|
#   c = Category.create!(
#     name: Faker::Restaurant.name
#   )
#   puts "Category #{c}"
# end

# 20.times do |ca|
#   ca = CategoryEvent.create!(
#     category_id: Category.all.sample.id,
#     event_id: Event.all.sample.id
#   )
# end
