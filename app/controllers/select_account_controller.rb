class SelectAccountController < ApplicationController
  skip_before_action :ask_user_to_select_account_type

  # when the account is already created using Facebook login
  def update
  end
end