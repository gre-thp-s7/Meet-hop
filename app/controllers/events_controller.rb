class EventsController < ApplicationController

  # needed for active storage see if we can have it in application helper or says that we don't need to require it somewhere

  require 'open-uri'
  include EventsHelper

###### protection against path in search browser bar ######
  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_edit_the_event, only: [:edit, :update, :destroy]
############################################################

  def index
    @events = Event.all.order("start_date")
  end

  def show

    who_is_the_user

    params.permit(:id)
    @event = Event.find(params[:id])
    @users = User.all
  end

  def new
    @new = true
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
      dancer_price: post_params[:dancer_price],
      spectator_price: post_params[:spectator_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      zipcode: post_params[:zipcode],
      city_name: post_params[:city_name],
      address: post_params[:address]
      )
    @event.picture.attach(post_params[:picture])
    @event.locality_id = 1
    @event.promoter_id = current_user.id

# this ligne add events categories
    @event.category_ids = params[:category]

    if @event.save!
      flash[:success] = "évènement créé !"
      redirect_to(event_path(@event.id))
    else
      flash[:danger] = "problème a la création, essaye encore "
      reender :new      
    end

  end

  def edit

    @new = false
    if @promotor == false
      flash.now[:danger] = "ne devrais pas pouvoir arriver ici, car n'est pas le créateur de l'event"
    end

    @event = Event.find_by(id: params[:id])
    @all_categories = Category.all
    @categories = Category.new

  end


  def update

#    posted_paramse = params.permit(:event)
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
      zipcode: post_params[:zipcode],
      city_name: post_params[:city_name],
      address: post_params[:address]
      )

      # these lines change the attached picture
      if params[:event][:picture] != nil
        @event.picture.attach(params[:event][:picture])
        @event.save
      end

      flash[:success] = "Ton évenement a bien été modifié!"
      flash[:danger] = "faudra envoyer un mail aux gens inscrits !"
      redirect_to event_path(@event)
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

private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit()
  end

end