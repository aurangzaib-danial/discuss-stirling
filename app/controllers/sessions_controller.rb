class SessionsController < ApplicationController

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
