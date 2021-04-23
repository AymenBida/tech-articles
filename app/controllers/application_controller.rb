class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  private

  def require_login
    return if user_signed_in?

    flash[:alert] = 'You must be logged in to access this section'
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
