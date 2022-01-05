class SelectAccountController < ApplicationController
  before_action :redirect_if_account_type_selected, if: :user_signed_in?
  skip_before_action :ask_user_to_select_account_type

  # when the account is already created using Facebook login
  def update
    Current.user.set_account_type(params[:account])
    Current.user.save
    redirect_to root_path
  end

  private
  def redirect_if_account_type_selected
    redirect_to root_path if Current.user.account_type_selected?
  end
end