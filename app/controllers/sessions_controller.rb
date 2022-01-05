class SessionsController < ApplicationController
  skip_before_action :ask_user_to_select_account, only: :destroy
  before_action :redirect_if_user_logged_in, except: :destroy
  before_action :authenticate_user!, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])

    if @user.present? && @user.authenticate(user_params[:password])
      login(@user)
    else
      @user ||= User.new
      @user.errors.add(:email, "or password is incorrect")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user)
  end
end
