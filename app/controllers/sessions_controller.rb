class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    redirect_to categories_path if current_user
  end

  def create
    @user = User.find_by(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to categories_path, notice: "Welcome #{@user.name}! You are now logged in!"
    else
      flash.now.alert = 'Sorry, the user name is incorrect.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Goodbye! You're now logged out!"
  end
end
