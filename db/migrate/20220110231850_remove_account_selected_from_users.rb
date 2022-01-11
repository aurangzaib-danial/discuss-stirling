class RemoveAccountSelectedFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :account_selected 
  end
end
