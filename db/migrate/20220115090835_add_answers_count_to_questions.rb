class AddAnswersCountToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answers_count, :integer
  end
end
