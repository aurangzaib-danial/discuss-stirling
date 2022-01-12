require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "validates body presence" do
    question = Question.new
    question.body = ""
    question.valid?

    assert question.errors[:body].present? 
  end

  test "validates body lenth" do
    question = Question.new
    question.body = "very short body"
    question.valid?
    assert question.errors[:body].present?
  end
end
