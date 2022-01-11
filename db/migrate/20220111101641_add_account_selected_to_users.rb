class AddAccountSelectedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_selected, :boolean, default: false 
  end
end
