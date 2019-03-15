class EventsController < ApplicationController

  # for later with piture and active storage
  require 'open-uri'

###### protection against path in search browser bar ######
  before_action :authenticate_user!, only: [:new, :create]
  before_action :is_promoter_of_the_event, only: [:edit, :update, :destroy]
############################################################

############ method to create variable for "if" in front ####
### it give boolean for each ###########
  def whosit
    @promotor = is_promoter_of_the_event
    @already_participant = already_subscribed_to_the_event
    @subscribtion_possible = can_subscribe_for_event
  end
#############################################

  def index
    @events = Event.all
  end

  def show
    whosit
    post_params = params.permit(:id)
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @all_categories = Category.all
    @categories = Category.new
  end

  def create
    post_params = params.require(:event).permit!
    params.permit(:category)
    @event = Event.new(
      name: post_params[:name],
      description: post_params[:description],
      start_date: post_params[:start_date],
      duration: post_params[:duration],
      spectator_price: post_params[:spectator_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      )
    @event.picture.attach(post_params[:picture])
    @event.locality_id = 1
    @event.promoter_id = current_user.id


@event.category_ids = params[:category]

    if @event.save!
      flash[:success] = "évènement créé !"
      redirect_to(event_path(@event.id))
    end

  end

  def edit
    @event = Event.find_by(id: params[:id])
    @all_categories = Category.all
    @categories = Category.new
  end


  def update
    posted_paramse = params.permit(:event)
    post_params = params.require(:event).permit!

    @event = Event.find_by(id: params[:id])

    if @event.update(
      name: post_params[:name],
      description: post_params[:description],
      start_date: post_params[:start_date],
      duration: post_params[:duration],
      spectator_price: post_params[:spectator_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      )

    if params[:event][:picture] != nil
      @event.picture.attach(params[:event][:picture])
      @event.save
    end


      flash[:success] = "Ton évenement a bien été modifié connard !"
<<<<<<< HEAD
      flash[:danger] = "faudra envoyer un mail aux gens inscrits !"
      redirect_to event_path(@event)
=======
      flash[:danger] = "faudra envoyer un mail au gens inscrit !"
      redirect_to event_path(@event.id)
>>>>>>> 0df8c073a9e00eca75d8623260ecbc8a6421aa20
    else
      render :edit
    end
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

  def event_params
    params.require(:event).permit()
  end

end
