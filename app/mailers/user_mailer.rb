class UserMailer < ApplicationMailer
  default from: 'no-reply@Meet-Hop.com'
  
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://meet-hop.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(
      to: @user.email,
      subject: 'Bienvenue chez nous !'
      ) 
  end

  def registration_email(user, event)

    @event = event

    @user = user 

    @url  = 'https://meet-hop.herokuapp.com/login' 

    # Je dois trouver la façon de ramener l'email d'un user, continuer les tests en console
    mail(
      to: @user.email,
      subject: 'Comfirmation de votre inscription'
      ) 
  end
end
