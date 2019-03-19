class ChargesController < ApplicationController

def new
  params.permit!
  binding.pry
    @categories = params[:categories]
  @amount = 500
  puts "CHARGES#CONTROLLER#NEW"
  puts params
  puts "USERS IS AFTER THIS"
  puts current_user.id
end

def create
  puts "CHARGES#CONTROLLER#CREATE"
  puts params
  params.permit!
  binding.pry
  @categories = params[:categories].split
  puts "DANCE CATEGOIES ARE AFTER THIS"
  puts @categories  
  @event_id = params[:event]
  @user_id = current_user.id

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
################# il faudra enlever ca  une fois l'ajax fait
if params[:dancer]
    @registration.category_ids = @categories
end
###########################################

  #Some payment attempts fail for a variety of reasons, such as an invalid CVC, bad card number, or general decline. Any Stripe::CardError exception will be caught and stored in the flash hash.
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_event_charge_path
  end

end