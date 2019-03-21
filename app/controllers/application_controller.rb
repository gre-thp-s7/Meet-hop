class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :danger, :info, :warning, :success

private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi stp!"
      redirect_to new_session_path
    end
  end


  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end

end
