class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.belongs_to :followable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :follows, [:followable_type, :followable_id, :user_id], unique: true, name: "unqiue_follow"
  end
end
