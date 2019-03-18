class ChargesController < ApplicationController
=begin 
The controller does two things:
-------------------------------
  Shows a credit card form (using Checkout).
  Creates the actual charges by calling our API.
=end

def new
  @amount = 500
  @registration = Registration.new
  puts params
end

def create
  puts params
  params.permit!

  event_id = @event
  user_id = current_user

  @amount = 500

  # Amount in cents

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
  
  redirect_to new_registration_path
  end

  @registration = Registration.new(
    event_id: :event,
    user_id: :current_user)

  @registration.save


end