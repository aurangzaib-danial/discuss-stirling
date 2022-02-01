# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_notifications
    user = User.first
    UserMailer.with(user: user).new_notifications
  end
end