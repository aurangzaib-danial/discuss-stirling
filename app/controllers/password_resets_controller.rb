class PasswordResetsController < ApplicationController
  before_action :set_user, except: [:new, :create]

  def create
    @user = User.find_by_email(params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    redirect_to login_path, notice: "You will receive password reset instructions if an account with that email exists."
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset") 
    if @user.update(password: params[:user][:password])
      redirect_to login_path, notice: "Your password was reset successfully. Please sign in."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find_signed!(params[:token], purpose: "password_reset") 
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "Your password reset link has expired. Please request a new one."
  end

end

