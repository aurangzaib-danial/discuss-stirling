namespace :notifications_reminder do
  desc "Send reminder to users for new notifications"
  task daily: :environment do
    User.daily.find_each do |user|
      user.notify_for_new_notifications_by_email
    end
  end
end
