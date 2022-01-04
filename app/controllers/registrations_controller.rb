class RegistrationsController < ApplicationController
  def new
    if !params[:account].present? || !params[:account].in?(["private", "public"])
      redirect_to select_account_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.private = true if params[:account] == "private"
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :private)
  end
end
