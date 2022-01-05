class RenameAccountTypeSelectedToAccountSelected < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :account_type_selected, :account_selected
  end
end
