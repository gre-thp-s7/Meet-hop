class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    puts request.env['omniauth.auth'].inspect
    @user = User.from_facebook(request.env['omniauth.auth'])

    if @user.persisted?

      sign_in_and_redirect @user, event: :authentication
      flash[:success] = "Vous êtes connecté avec facebook"

    else
      flash[:error] = "La connexion avec facebook a échoué, veuillez compléter le formulaire"

      #recupere les infos users afin de preremplir
      session['devise.facebook'] = request.env['omniauth.auth']

      redirect_to new_user_registration_url
    end
  end
end