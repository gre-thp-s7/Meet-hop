class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
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

  def show
  end

  def create
    params.permit!
    puts "CONTROLLER#REGISTRATIONS#CREATE"
    puts params
  
    event_id = params[:event]
    user_id = current_user.id

    @registration = Registration.new(
      event_id: event_id,
      user_id: user_id)

    if @registration.save
      flash[:success] = "Vous participez à l'évènement."
      redirect_to event_path(@event.id)
      puts "#####PARTICIPATION OK#####"
    else 
      flash[:error] = "Une erreur s'est produite"
      redirect_to event_path
    end
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