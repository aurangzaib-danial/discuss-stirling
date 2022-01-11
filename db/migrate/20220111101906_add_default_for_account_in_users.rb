class AddDefaultForAccountInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :account, 0
  end
end
