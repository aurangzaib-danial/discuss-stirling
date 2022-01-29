class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user


  def update
    if @user.update user_params
      redirect_to settings_path, notice: "Settings updated"
    else
      current_user.reload
      render :show, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params[:user].delete(:password) if params[:user][:password].empty?
    params.require(:user).permit(:name, :email, :account, :email_notifications_frequency, :password)
  end

  def set_user
    @user = current_user.clone
  end
end
