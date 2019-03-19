class RegistrationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_subs, only: [:new, :create]

  def new
    @can_subs = can_subs
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
############# please let these comments for the moment <- yaya 
## could be nice to put them in a helper
### these are not working anymore in the application controller
## that's wy they are here

  def is_promot
    params.permit(:event_id)
    event = Event.find_by(id: params[:event_id])
    #binding.pry
    if current_user.id == event.promoter_id
      flash.now[:info] = "tu es le créateur de l'événement"  
      end  
  end 

  def already_subs
    params.permit(:event_id)
    @event = Event.find_by(id: params[:event_id])
    #binding.pry
    if @event.registrations.find_by(user_id: current_user.id) != nil
      flash.now[:info] = "tu es déja inscrit"        
      return true
    else
      flash.now[:info] = "tu n'es pas inscrit" 
      return false
    end
  end

  def can_subs 
    #binding.pry
    params.permit(:event_id)
    if is_promot || already_subs
      flash.now[:danger] = "tu ne peux pas t'inscrire"
      #binding.pry
      redirect_to event_path(params[:event_id]) and return false
    else
      flash.now[:success] = "tu peux t'inscrire"
      return true
    end
  end

############################################################# 
end