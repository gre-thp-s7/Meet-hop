class ChargesController < ApplicationController

def new
  params.permit!
  @dancer = params[:dancer]
  @categories = params[:categories]
  @event = Event.find(params[:event_id])
  
  if @dancer == "true"
    @amount = @event.dancer_price.to_i * 100
  else
    @amount = @event.spectator_price.to_i * 100
  end 

end

def create

  params.permit!

  @user_id = current_user.id
  @event = Event.find(params[:event_id])
  
  if @dancer == "true"
    @amount = @event.dancer_price
  else
    @amount = @event.spectator_price
  end

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount.to_i * 100,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_event_charge_path
  end

end