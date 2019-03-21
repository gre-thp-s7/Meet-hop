module RegistrationsHelper

	def permitparams
    params.permit(:event_id)		
	end 

  def is_promot
    event = Event.find_by(id: params[:event_id])
    if current_user.id == event.promoter_id
      flash.now[:info] = "tu es le créateur de l'événement"  
      end  
  end 

  def already_subs
    @event = Event.find_by(id: params[:event_id])    
    if @event.registrations.find_by(user_id: current_user.id) != nil
      flash.now[:info] = "tu es inscrit a cet événement"        
#      flash.now[:info] = "tu es déja inscrit"        
      return true
    else
      return false
    end
  end

  def can_subs 
    permitparams
    if is_promot || already_subs
#      flash.now[:danger] = "tu ne peux pas t'inscrire"
      redirect_to event_path(params[:event_id]) and return false
    else
#      flash.now[:success] = "tu peux t'inscrire"
      return true
    end
  end

end
