class PromoterMailer < ApplicationMailer
    default from: 'no-reply@Meet-Hop.com'
    
    def event_creation_email(event)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user


      @event = event
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'url de levent'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(
        to: @event.promoter.email,
        subject: 'Votre évènement!'
        ) 
    end
  
    # def registration_email(user, event)
  
    #   @event = event
  
    #   @user = user 
  
    #   @url  = 'https://meet-hop.herokuapp.com/login' 
  
    #   # Je dois trouver la façon de ramener l'email d'un user, continuer les tests en console
    #   mail(
    #     to: @user.email,
    #     subject: 'Comfirmation de votre inscription'
    #     ) 
    # end
  end
  
