class DashboardController < ApplicationController
  layout "dashboard"
  def index
	
		params.permit(:user_id)

    @user = User.find_by(id: params[:user_id])
  	@event_created = Event.where(promoter: @user)
  	@event_participed = Registration.where(user: @user)
  	@event_participed_dancer = @event_participed.where(role: "dancer")  	
  	@event_participed_spectator = @event_participed.where(role: "spectator")



puts "@"*60
puts "ici les evenement créer"
puts "il y en a #{@event_created.length}"
	@event_created.each do |i|
		puts "#{i.name}"
	end

puts "@"*60
puts "ici les evenement participé en tant que danseur"
puts "il y en a #{@event_participed_dancer.length}"
	@event_participed_dancer.each do |i|
		puts "#{i.event.name}"
	end

puts "@"*60
puts "ici les evenement participé en tant que spectateur"
puts "il y en a #{@event_participed_spectator.length}"
	@event_participed_spectator.each do |i|
		puts "#{i.event.name}"
	end
puts "@"*60

  end

  def show
  end

end
