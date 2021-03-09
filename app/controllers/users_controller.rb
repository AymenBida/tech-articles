class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Welcome #{@user.name}! You can now login."
    else
      flash.now.alert = "Sorry, we couldn't process your request."
      render :new
    end
  end
end
