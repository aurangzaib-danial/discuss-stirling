class RegistrationsController < ApplicationController
  before_action :ask_user_to_select_account_type, if: :user_signed_in?, except: :select_account
  
  def new
    if !params[:account].present? || !params[:account].in?(["private", "public"])
      redirect_to select_account_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.set_account_type(params[:account])
    if @user.save
      login(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :private)
  end
end
