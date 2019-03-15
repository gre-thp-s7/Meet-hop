class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def destroy
    sign_out_and_redirect(root_path)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    puts "**"*100
    puts @current_page
    puts @params
    puts "**"*100
<<<<<<< HEAD
    post_params = params[:profile]
=======
    post_params = params.require(:user).permit!

    if params[:user][:avatar] != nil
      @user.avatar.attach(params[:user][:avatar])
      @user.save
    end

    if @user.update(
      first_name: post_params[:first_name], 
      last_name: post_params[:last_name], 
      phone: post_params[:phone]
      )
>>>>>>> b75c438444dbc77c79a94c2aeff00d64ae9164f8

      flash[:notice] = "Vous avez bien mis à jour votre profil"

      redirect_to user_path(current_user.id)
    else
      if @user.errors.any?
        @user.errors.full_messages.each do |message|
          flash[:error] =  "#{message}"
        end
      end
      redirect_to request.referrer
    end

  end

  def show
    @user = current_user
  end

  
end
