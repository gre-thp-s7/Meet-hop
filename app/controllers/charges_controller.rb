class ChargesController < ApplicationController

def new
    params.permit(:event, :dancer, :category)
    @event = Event.find(params[:event])
    @categories = []
    @dancer = params[:dancer]

    @categories = params[:categories]
    @amount = "3700"
end

def create
  params.permit(:amount, :event, :dancer, :categories)
  @amount = params[:amount]
  @event_id = params[:event]
  @categories = params[:categories].split
  @babar = current_user.id
    puts "@"*60
    puts "voici les catégories auquel s'est inscrit le danseur"
    puts " l'array d'id des danses #{@categories} %>"

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

################# il faudra enlever ca  une fois l'ajax fait
if params[:dancer]
    @registration.category_ids = @categories
end
###########################################
    @registration.save!


    puts "@"*60
    puts "registration crée"

    rescue Stripe::CardError => e
    flash[:error] = e.message
    binding.pry
    redirect_to new_registration_path
    end

end