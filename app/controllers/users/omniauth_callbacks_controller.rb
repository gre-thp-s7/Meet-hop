class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    puts request.env['omniauth.auth'].inspect
    @user = User.from_facebook(request.env['omniauth.auth'])

    if @user.persisted?

      sign_in_and_redirect @user, event: :authentication
      flash[:success] = "Vous êtes connecté avec facebook"

    else
      flash[:error] = "La connexion avec facebook a échoué, veuillez compléter le formulaire"

      #Catch user s informations
      session["devise.facebook_data"] = request.env["omniauth.auth"]

      redirect_to new_user_registration_url
    end
    
    def failure
      redirect_to root_path
    end
  end
end