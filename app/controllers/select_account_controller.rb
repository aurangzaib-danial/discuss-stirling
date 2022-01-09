class SelectAccountController < ApplicationController
  # before_action :redirect_if_account_selected, if: :user_signed_in?
  # skip_before_action :ask_user_to_select_account
  before_action :authenticate_user!, only: :update

  # when the account is already created using Facebook login
  def update
    Current.user.set_account(params[:account])
    Current.user.save
    redirect_to root_path
  end

  private
  def redirect_if_account_selected
    redirect_to root_path if Current.user.account_selected?
  end
end