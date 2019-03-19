class EventsController < ApplicationController

  # for later with piture and active storage
  require 'open-uri'

###### protection against path in search browser bar ######
  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_edit_the_event, only: [:edit, :update, :destroy]
############################################################

### needed this method cause i can't redirect with is_promoter_of_the_event when ask in edit#event navigation bar without causing error somewhere else
  def can_edit_the_event
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])
    if current_user.id == event.promoter_id
      flash.now[:info] = "tu es bien le créateur de l'événement"  
    else      
      flash[:info] = "tu n'es pas le créateur de l'événement"
      redirect_to root_path and return false
    end   
  end 
########################################

############ method to create variable for "if" in front ####
### it give boolean for each ###########
  def who_is_the_user
    @promotor = is_promoter_of_the_event
    @already_participant = already_subscribed_to_the_event
    @subscribtion_possible = can_subscribe_for_event
  end
#############################################

  def index
    @events = Event.all.order("start_date")
  end

  def show
    who_is_the_user
    post_params = params.permit(:id)
    @event = Event.find(params[:id])
    @users = User.all
  end

  def new
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
      spectator_price: post_params[:spectator_price],
      rules: post_params[:rules],
      prize_money: post_params[:prize_money],
      )
    @event.picture.attach(post_params[:picture])
    @event.locality_id = 1
    @event.promoter_id = current_user.id


@event.category_ids = params[:category]

    if @event.save!
      flash[:success] = "évènement créé !"
      redirect_to(event_path(@event.id))
    end

  end

  def edit

    if @promotor == false
      flash.now[:danger] = "ne devrais pas pouvoir arriver ici, car n'est pas le créateur de l'event"
    end


    @event = Event.find_by(id: params[:id])
    @all_categories = Category.all
    @categories = Category.new
  end


  def update
    posted_paramse = params.permit(:event)
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
      )

    if params[:event][:picture] != nil
      @event.picture.attach(params[:event][:picture])
      @event.save
    end


      flash[:success] = "Ton évenement a bien été modifié connard !"
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