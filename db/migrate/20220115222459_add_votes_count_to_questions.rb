class AddVotesCountToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :votes_count, :integer, default: 0
  end
end
