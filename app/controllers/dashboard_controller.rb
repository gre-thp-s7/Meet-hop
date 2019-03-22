class DashboardController < ApplicationController

  def index
	
		params.permit(:user_id)

    @user = User.find_by(id: params[:user_id])
  	@event_created = Event.where(promoter: @user)
  	@event_participed = Registration.where(user: @user)
  	@event_participed_dancer = @event_participed.where(role: "dancer")  	
		@event_participed_spectator = @event_participed.where(role: "spectator")
		
  end
end
