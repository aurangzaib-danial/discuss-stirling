class UserMailer < ApplicationMailer
  def new_notifications
    @user = params[:user]
    @notification_count = @user.notifications.new_for_email_count
    mail(to: @user.email, subject:  "You have #{@notification_count} new #{"notification".pluralize(@notification_count)}")
  end
end
