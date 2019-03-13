class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def destroy
  end

  def edit
    @user = current_user
    @profile = User.find_by(user_id: @user.id)    
  end

  def update
    @user = current_user
    @profile = User.find_by(user_id: @user.id)
    puts "**"*100
    puts @current_page
    puts @params
    puts "**"*100
    post_params = params[:profile]

    if @profile.update(first_name: post_params[:first_name], last_name: post_params[:last_name], phone: post_params[:phone])
      flash[:notice] = "Vous avez bien mis à jour votre profil"

      redirect_to request.referrer
    else
      if @profile.errors.any?
        @profile.errors.full_messages.each do |message|
          flash[:error] =  "#{message}"
        end
      end
      redirect_to request.referrer
    end

  end

  def show
    @user = current_user
    @profile = User.find_by(user_id: @user.id)      
  end

end
