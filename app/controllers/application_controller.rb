class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :user_signed_in?

  def set_current_user
    Current.user = User.find(session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    Current.user.present?
  end

  def login(user)
    session[:user_id] = user.id
    redirect_to root_path
  end
end
