class ApplicationController < ActionController::Base
  before_action :set_current_user, if: :user_signed_in?
  before_action :ask_user_to_select_account, if: :user_signed_in?

  helper_method :user_signed_in?

  def set_current_user
    Current.user = User.find(session[:user_id])
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def ask_user_to_select_account
    redirect_to select_account_path unless Current.user.account_selected?
  end

  def login(user)
    session[:user_id] = user.id
    redirect_to root_path
  end
end
