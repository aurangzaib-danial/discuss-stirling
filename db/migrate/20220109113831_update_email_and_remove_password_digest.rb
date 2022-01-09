class UpdateEmailAndRemovePasswordDigest < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false
    change_column_default :users, :email, ""    
    remove_column :users, :password_digest
  end
end
