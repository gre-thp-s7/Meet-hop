class ApplicationController < ActionController::Base

  layout "landing"

# ajout des quatres alertes principale en bootstrap (3autres manquantes)
  add_flash_types :danger, :info, :warning, :success


############## add by yaya : have to TTTEEESSSSTTT them to use them 
private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi stp con***** !"
      redirect_to new_session_path
    end
  end

  def is_promotor_of_the_event
    puts "@"*60
    puts "admin?"
    puts "this method looks if your the creator of the event"
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])
    current_user.id == event.promoter_id
  end 

  def already_subscribed_to_the_event
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    puts "@"*60
    puts "déja inscrit?"
    puts "this method looks if your already participant of the event"    
    if @event.registration.find_by(user_id: current_user.id) != nil
      return true
    else
      return false
    end
  end

  def can_subscribe_for_event
    puts "@"*60
    puts "pas admin et pas inscrit ?" 
    puts "this method looks if you can subscribe to the event"    
    if is_admin || already_subscribed
      return false
    else
      return true
    end
  end
###################################################


end
