class RemovePrivateAndUseAccountAttributeInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :private
    add_column :users, :account, :integer
  end
end
