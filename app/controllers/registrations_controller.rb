class RegistrationsController < ApplicationController

include RegistrationsHelper

  before_action :authenticate_user!, only: [:new, :create]
  before_action :can_subs, only: [:new]

  def new

    params.permit!  

    @can_subs = can_subs

    @event = Event.find(params[:event_id])
    @categories = @event.categories

    @registration = Registration.new

  end

  def create

    params.permit!

    user_id = current_user.id

    @registration = Registration.new(
      event_id: params[:event_id],
      user_id: user_id)

    @categories = params[:categories].split

    ################# il faudra enlever ca  une fois l'ajax fait
    if params[:dancer] == "true"
      @registration.category_ids = @categories
      @registration.role = "dancer"
    else
      @registration.role = "spectator"
    end
    ###########################################

      
    if @registration.save!
      flash[:success] = "Vous venez de vous inscrire à l'évènement."
      puts "#####PARTICIPATION OK#####"
      redirect_to event_path(params[:event_id])
    else
      flash[:danger] = "problème = recommence"
      render :new
    end

  end


end