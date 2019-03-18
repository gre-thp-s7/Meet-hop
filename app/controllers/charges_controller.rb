class ChargesController < ApplicationController
=begin 
The controller does two things:
-------------------------------
  Shows a credit card form (using Checkout).
  Creates the actual charges by calling our API.
=end

def new
    binding.pry
    params.permit(:event, :danseur, :category)
    @event = Event.find(params[:event])
    @categories = params[:category]
    @amount = "3700"
end

def create
  binding.pry
  params.permit(:amount, :event)
  @amount = params[:amount]
  @event_id = params[:event]
  @babar = current_user.id


  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'eur'
  )

  @registration = Registration.new
  @registration.user_id = @babar
  @registration.event_id = @event_id
  @registration.save
  puts "@"*60
  puts "registration crée"
  
  rescue Stripe::CardError => e
  flash[:error] = e.message
  binding.pry
  redirect_to new_registration_path
  end







end