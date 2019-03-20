class PromoterMailer < ApplicationMailer
    default from: 'no-reply@Meet-Hop.com'
    
    def event_creation_email(event)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user


      @event = event
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = "https://meet-hop.herokuapp.com/login"
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(
        to: @event.promoter.email,
        subject: 'Votre évènement!'
        ) 
    end
  
    def event_registration_email(user, event)

    	@event_participed = Registration.where(user: @user)
      @event_participed_dancer = @event_participed.where(role: "dancer")  	
      @event_participed_spectator = @event_participed.where(role: "spectator")

      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user

      @event = event
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'url de levent'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(
        to: @event.promoter.email,
        subject: 'Une personne s\'est inscrite à votre évènement!'
        ) 
    end

    def event_update_email(user, event)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user

      @event = event
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'url de levent'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(
        to: @user.email,
        subject: 'L\évènement auquel vous participez a été mise à jour!'
        )
    end
  end
  
