class AddNotifiedByEmailToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :notified_by_email, :boolean, default: false
  end
end
