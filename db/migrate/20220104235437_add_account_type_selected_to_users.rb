class AddAccountTypeSelectedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_type_selected, :boolean, default: false
  end
end
