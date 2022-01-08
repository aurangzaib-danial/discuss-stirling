class AddIndexOnTitleInSubjects < ActiveRecord::Migration[7.0]
  def change
    add_index :subjects, :title, unique: true
  end
end
