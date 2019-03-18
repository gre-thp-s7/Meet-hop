class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    params.permit(:format)
    event_id = params[:format]
    @user = current_user
    @event = Event.find(event_id)
    @registration = Registration.new
  end

  def show
  end

  def create

    params.permit!

    event_id = params[:event]
    @user = current_user
    # @event = Event.find(event_id)

  @amount = 100
  
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
  
  #Some payment attempts fail for a variety of reasons, such as an invalid CVC, bad card number, or general decline. Any Stripe::CardError exception will be caught and stored in the flash hash.
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @event

    @registration = Registration.new(event_id: @event, user_id: @user)


    if @registration.save
      flash[:success] = "Vous participez à l'évènement."
      redirect_to @event
      return
    else 
      flash[:error] = "Une erreur s'est produite"
      redirect_to @event
    end
  end


  def edit
  end

  def destroy
  end

  private

  def registration_params
    params.require(:registration).permit(:user_id, :event_id)
  end
end