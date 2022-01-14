module AnswerHelper
  def answers_count(answers)
    content_tag :span, pluralize(answers.count, 'Answer'), id: "answersCount"
  end
end