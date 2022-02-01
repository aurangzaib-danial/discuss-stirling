class UserMailer < ApplicationMailer
  def new_notifications
    @user = params[:user]
    @notification_count = params[:notification_count]
    mail(to: @user.email, subject:  "You have #{@user.notifications.new_for_email_count} new notifications")
  end
end
