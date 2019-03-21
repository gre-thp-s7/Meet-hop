module EventsHelper

  def who_is_the_user
    if current_user != nil
      @promotor = is_promoter_of_the_event
      @already_participant = already_subscribed_to_the_event
      @subscribtion_possible = can_subscribe_for_event
    else
      @promotor = false
      @already_participant = false
      @subscribtion_possible = false 
    end
  end

  def is_promoter_of_the_event
    params.permit(:id)
    event = Event.find(params[:id])

    if current_user.id == event.promoter.id
      flash[:info] = "tu es le créateur de l'événement"  
    else      
#      flash[:info] = "tu n'es pas le créateur de l'événement"
      return false
    end

  end 

  def already_subscribed_to_the_event
    post_params = params.permit(:id)
    @event = Event.find(params[:id]) 

    if @event.registrations.find_by(user_id: current_user.id) != nil
      flash[:info] = "tu es inscrit a cet evenement"  
      return true
    else
#      flash[:info] = "tu n'es pas inscrit" 
      return false
    end

  end

  def can_subscribe_for_event  
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id]) 

    if is_promoter_of_the_event || already_subscribed_to_the_event
#      flash.now[:danger] = "tu ne peux pas t'inscrire"
      render :show and return false
    else
#      flash.now[:success] = "tu peux t'inscrire"
      return true
    end

  end

### needed this method cause i can't redirect with is_promoter_of_the_event when ask in edit#event navigation bar without causing error somewhere else
  def can_edit_the_event
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])

    if current_user.id == event.promoter_id
      flash.now[:info] = "tu es bien le créateur de l'événement"  
    else      
      flash[:info] = "tu n'es pas le créateur de l'événement"
      redirect_to root_path and return false
    end  
  end 

end
