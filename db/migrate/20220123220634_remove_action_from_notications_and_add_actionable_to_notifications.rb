class RemoveActionFromNoticationsAndAddActionableToNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :action
    change_table :notifications do |t|
      t.belongs_to :actionable, polymorphic: true, null: false
    end
  end
end
