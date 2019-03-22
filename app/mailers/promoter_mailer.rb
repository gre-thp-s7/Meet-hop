class PromoterMailer < ApplicationMailer
    default from: 'no-reply@Meet-Hop.com'
    
    def event_creation_email(event)

      @event = event

      @url  = "https://meet-hop.herokuapp.com/login"

      mail(
        to: @event.promoter.email,
        subject: 'Votre évènement!'
        ) 
    end
  
    def event_registration_email(user, event)

      @event_participed = Registration.where(user: @user)
      @event_participed_dancer = @event_participed.where(role: "dancer")  	
      @event_participed_spectator = @event_participed.where(role: "spectator")

      @user = user

      @event = event

      @url  = 'https://meet-hop.herokuapp.com/login'
  
      mail(
        to: @event.promoter.email,
        subject: 'Une personne s\'est inscrite à votre évènement!'
        ) 
    end
    
    def event_update_email(user, event)
      
      @user = user

      @event = event

      @url  = 'https://meet-hop.herokuapp.com/login'
  
      mail(
        to: @user.email,
        subject: 'L\évènement auquel vous participez a été mise à jour!'
        )
    end
  end
  
