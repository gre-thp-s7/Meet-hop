class ChargesController < ApplicationController

def new
  params.permit!
  #binding.pry
  @dancer = params[:dancer]
  @categories = params[:categories]
  @event = Event.find(params[:event_id])
  
  if @dancer == "true"
    puts "le prix dancer #{@event.dancer_price}"
    @amount = @event.dancer_price
  else
    puts "le prix spectateur #{@event.spectator_price}"
    @amount = @event.spectator_price
  end 

  puts "CHARGES#CONTROLLER#NEW"
  puts params
  puts "USERS IS AFTER THIS"
  puts current_user.id
end

def create
  puts "CHARGES#CONTROLLER#CREATE"
  puts params
  params.permit!

  @user_id = current_user.id

  @event = Event.find(params[:event_id])
  
  if @dancer == "true"
    puts "le prix dancer #{@event.dancer_price}"
    @amount = @event.dancer_price
  else
    puts "le prix spectateur #{@event.spectator_price}"
    @amount = @event.spectator_price
  end 

#   @categories = params[:categories].split
#   puts "DANCE CATEGOIES ARE AFTER THIS"
#   puts @categories  
# ################# il faudra enlever ca  une fois l'ajax fait
# if params[:dancer] == true
#     @registration.category_ids = @categories
# end
# ###########################################

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

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_event_charge_path
  end

end