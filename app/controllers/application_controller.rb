class ApplicationController < ActionController::Base

  layout "landing"

  before_action :configure_permitted_parameters, if: :devise_controller?
# ajout des quatres alertes principale en bootstrap (3autres manquantes)
  add_flash_types :danger, :info, :warning, :success

############## add by yaya : have to TTTEEESSSSTTT them to use them 
private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi stp!"
      redirect_to new_session_path
    end
  end

  def is_promoter_of_the_event
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])
    if current_user.id == event.promoter_id
      flash[:info] = "tu es le créateur de l'événement"  
    else      
      flash[:info] = "tu n'es pas le créateur de l'événement"
      return false
    end   
  end 

  def already_subscribed_to_the_event
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id]) 
    if @event.registrations.find_by(user_id: current_user.id) != nil
      flash[:info] = "tu es déja inscrit"  
      return true
    else
      flash[:info] = "tu n'es pas inscrit" 
      return false
    end
  end

  def can_subscribe_for_event  
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id]) 
    if is_promoter_of_the_event || already_subscribed_to_the_event
      flash.now[:danger] = "tu ne peux pas t'inscrire"
      render :show and return false
    else
      flash[:success] = "tu peux t'inscrire"
      return true
    end
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end

end
