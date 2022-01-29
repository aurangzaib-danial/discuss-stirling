class ChangeOptionsInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :account, false
    change_column_null :users, :account_selected, false
    change_column_null :users, :email_notifications_frequency, false
  end
end
