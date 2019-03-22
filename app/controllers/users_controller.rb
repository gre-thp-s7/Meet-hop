class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
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

  def destroy
    sign_out_and_redirect(root_path)
  end
  
end
