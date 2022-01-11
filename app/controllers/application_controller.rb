class ApplicationController < ActionController::Base
  # before_action :ask_user_to_select_account, if: :user_signed_in?


  # TODO: Skip this for sign out
  # def ask_user_to_select_account
  #   redirect_to select_account_path unless current_user
  # end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
