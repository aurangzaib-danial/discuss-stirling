namespace :notifications_reminder do
  desc "Send reminder to users for new notifications"
  task daily: :environment do
    User.find_each do |user|
      user.notify_by_email
    end
  end

end
