class AddDefaultForAnswersCountInQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:questions, :answers_count, 0)
  end
end
