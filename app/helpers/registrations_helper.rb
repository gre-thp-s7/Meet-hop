module RegistrationsHelper

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
