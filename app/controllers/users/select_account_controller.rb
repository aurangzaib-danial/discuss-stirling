class Users::SelectAccountController < ApplicationController
  before_action :redirect_if_account_selected, if: :user_signed_in?
  skip_before_action :ask_user_to_select_account
  before_action :authenticate_user!, only: :update

  # when the account is already created using Facebook login
  def update
    current_user.set_account!(params[:account])
    redirect_to root_path
  end

  private
  def redirect_if_account_selected
    redirect_to root_path if current_user.account_selected?
  end
end