class AddEmailNotificationsFrequencyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_notifications_frequency, :integer, default: 0
  end
end
