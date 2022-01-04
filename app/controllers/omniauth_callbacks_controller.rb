class OmniauthCallbacksController < ApplicationController
  def facebook
   @user = User.find_or_initialize_by(email: auth.info.email) do |user|
    user.password = SecureRandom.hex(8) # set random password when new user
   end
   @user.update(name: auth.info.name) # always update user's name, they might have changed it on Facebook

   login(@user)
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end