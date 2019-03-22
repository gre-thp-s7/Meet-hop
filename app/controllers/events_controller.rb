class EventsController < ApplicationController

  # Needed for active storage see if we can have it in application helper or says that we don't need to require it somewhere
  require 'open-uri'
  include EventsHelper

  #==== Protection against path in search browser bar =====
  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_edit_the_event, only: [:edit, :update, :destroy]#=======================================================

  def index
    @events = Event.all.order("start_date")
    # @promoter = Event.where(promoter_id: current_user.id)
    # @spectator = Registration.where(role: "spectateur")
    # @dancer = Registration.where(role: "danceur")

  end

  def show

    who_is_the_user
    params.permit(:id)
    @event = Event.find(params[:id])
    @categories = []
    @categories = @event.categories
    @nb_cate = @categories.length
   # binding.pry

    @user = User.find_by(id: params[:user_id])

  	@event_participants = @event.registrations
  	@event_dancer = @event_participants.where(role: "dancer")
  	@event_spectator = @event_participants.where(role: "spectator") 

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

    @start_date = DateTime.civil(
      params[:event][:"start_date(1i)"].to_i,
      params[:event][:"start_date(2i)"].to_i,
      params[:event][:"start_date(3i)"].to_i,
      params[:event][:"start_date(4i)"].to_i,
      params[:event][:"start_date(5i)"].to_i
    )

    @duration_hours = params[:event][:"duration(4i)"].to_i * 60
    @duration_minutes = params[:event][:"duration(5i)"].to_i * 60
    @duration = @duration_hours + @duration_minutes
    params.permit(:category)

    @event = Event.new(
      name: post_params[:name],
      description: post_params[:description],
      start_date: @start_date,
      duration: @duration,
      dancer_price: post_params[:dancer_price],
      spectator_price: post_params[:spectator_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      zipcode: post_params[:zipcode],
      city_name: post_params[:city_name],
      address: post_params[:address]
      )
    @event.picture.attach(post_params[:picture])
    @event.promoter_id = current_user.id

  # This line add events categories
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

    post_params = params.require(:event).permit!

    @event = Event.find_by(id: params[:id])

    if @event.update(
      name: post_params[:name],
      description: post_params[:description],
      start_date: post_params[:start_date],
      duration: post_params[:duration],
      spectator_price: post_params[:spectator_price],
      dancer_price: post_params[:dancer_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      zipcode: post_params[:zipcode],
      city_name: post_params[:city_name],
      address: post_params[:address]
      )

      # These lines change the attached picture
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

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit()
  end

end
