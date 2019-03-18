class RegistrationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_subs, only: [:new, :create]

  def index
  end

  def new
    @can_subscribe = can_subs
    params.permit(:format)
    event_id = params[:format]
    @user = current_user
    @event = Event.find(event_id)
    @registration = Registration.new
    @categories = @event.categories
  end

  def show
  end

  def create
  end


  def edit
  end

  def destroy
  end

  private

end