class ApplicationController < ActionController::Base
  before_action :ask_user_to_select_account, if: :user_signed_in?

  helper_method :slug_path

  include Pundit

  def ask_user_to_select_account
    redirect_to users_select_account_path unless current_user.account_selected?
  end  

  def slug_path(object)
    question_slug_path(object.id, object.slug)
  end
end
