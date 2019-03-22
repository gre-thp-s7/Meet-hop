class UserMailer < ApplicationMailer
  default from: 'no-reply@Meet-Hop.com'
  
  def welcome_email(user)

    @user = user 

    @url  = 'https://meet-hop.herokuapp.com/login' 

    mail(
      to: @user.email,
      subject: 'Bienvenue chez nous !'
      ) 
  end

  def registration_email(user, event)

    @event = event

    @user = user 

    @url  = 'https://meet-hop.herokuapp.com/login' 

    mail(
      to: @user.email,
      subject: 'Comfirmation de votre inscription'
      ) 
  end
end
