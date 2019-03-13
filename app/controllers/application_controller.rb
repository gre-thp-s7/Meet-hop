class ApplicationController < ActionController::Base

  layout "landing"

# ajout des quatres alertes principale en bootstrap (3autres manquantes)
  add_flash_types :danger, :info, :warning, :success


############## add by yaya have to modify them to use them 
private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi stp !"
      redirect_to new_session_path
    end
  end

  # def is_admin?
  #   puts "@"*60
  #   puts "admin?"
  #   post_params = params.permit(:id)
  #   event = Event.find_by(id: params[:id])
  #   @user.id == event.admin_id
  # end 

  # def already_subscribed?
  #   post_params = params.permit(:id)
  #   @event = Event.find_by(id: params[:id])
  #   puts "@"*60
  #   puts "déja inscrit?"
  #   if @event.attendances.find_by(user_id: current_user.id) != nil
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def can_subscribe_for_event?
  #   puts "@"*60
  #   puts "pas admin et pas inscrit ?" 
  #   if is_admin? || already_subscribed?
  #     return false
  #   else
  #     return true
  #   end
  # end
###################################################


end
