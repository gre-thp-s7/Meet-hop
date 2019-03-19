class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    puts "CONTROLLER#REGISTRATIONS#NEW"
    params.permit!
    puts params
    
    event_id = params[:event_id]
    user_id = current_user.id
    
    puts event_id
    puts current_user.id

    @event = Event.find(event_id)
    @registration = Registration.new
    @categories = @event.categories

  end

  def create
    params.permit!
    puts "CONTROLLER#REGISTRATIONS#CREATE"
    puts params
  
    event_id = params[:event_id]
    user_id = current_user.id

    @registration = Registration.new(
      event_id: event_id,
      user_id: user_id)
    
    
    @registration.save!
      flash[:success] = "Vous participez à l'évènement."
      

      puts "#####PARTICIPATION OK#####"

  end
  
  def edit
  end

  def destroy
  end

  private

  def registration_params
    params.require(:registration).permit(:user_id, :event_id)
  end
end