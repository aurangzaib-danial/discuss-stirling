require "application_system_test_case"

class AskQuestionTest < ApplicationSystemTestCase
  test "new question can be asked" do
    # login users(:regular)
    visit ask_question_path
    binding.irb

    assert_selector "h2", text: "Ask a question"
  end
end