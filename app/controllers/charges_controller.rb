class ChargesController < ApplicationController
=begin 
The controller does two things:
-------------------------------
  Shows a credit card form (using Checkout).
  Creates the actual charges by calling our API.
=end
def new
end

def create
  # Amount in cents
  @amount = 500

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
  redirect_to new_charge_path
  end
end