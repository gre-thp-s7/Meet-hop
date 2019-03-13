class EventsController < ApplicationController
  
  # for later with piture and active storage
  require 'open-uri'
  
  before_action :authenticate_user, only: [:new, :create]
  before_action :authenticate_admin, only: [:edit, :update, :destroy]

  # GET /events with (index.html.erb)
 def index
  @events = Event.all
      @nb_events = Event.all.length
      @last_event1 = Event.find_by(id: @nb_events)
      @last_event2 = Event.find_by(id: @nb_events-1)
      @last_event3 = Event.find_by(id: @nb_events-2)
end

# GET /events/:id with (show.html.erb)
def show
  binding.pry 
  #post_params = params.permit.....

  @event = Event.find(params[:id])
end

# GET /events/new with (new.html.erb)
def new
  @new_event = Event.new
end



def create
  binding.pry
  #post_params = params.require(:new_event).permit(all)
  @new_event = Event.new

  if @new_event.save!
    flash[:success] = "évènement créé !"
    redirect_to(root_path)
  end

  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
  # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
end

# GET /events/:id/edit with (edit.html.erb)
def edit
  binding.pry 
  #post_params = params.permit.....
  @event_to_edit = Event.find_by(id: params)
end

# PUT/PATCH /events/:id with (edit.html.erb)
def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
end

# DELETE events/:id
def destroy
  @event.destroy
  respond_to do |format|
    format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
  end
end

=begin
def registration
  if @event.registration.include? current_user
    flash[:error] = "Vous participez déjà à l'évènement."
    redirect_to @event
    return
  end

@amount = @event.spectator_price

#The code first creates a Customer object using two POST parameters. You can create a charge directly, but creating a customer first allows for repeat billing.

#The :source property is set to the stripeToken parameter, representing the payment method provided. The token is automatically created by Checkout.
customer = Stripe::Customer.create({
  email: params[:stripeEmail],
  source: params[:stripeToken],
})

charge = Stripe::Charge.create({
  customer: customer.id,
  amount: @amount,
  description: 'Rails Stripe customer',
  currency: 'eur',
})

@event.registration << current_user
flash[:success] = "Vous participez à l'évènement."
redirect_to @event

#Some payment attempts fail for a variety of reasons, such as an invalid CVC, bad card number, or general decline. Any Stripe::CardError exception will be caught and stored in the flash hash.
rescue Stripe::CardError => e
flash[:error] = e.message
redirect_to @event
end
end
=end


private
# Use callbacks to share common setup or constraints between actions.
def set_event
  @event = Event.find(params[:id])
end

# def event_params
#   params.require(:event).permit()
# end
end
