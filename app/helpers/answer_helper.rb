module AnswerHelper
  def answers_count(count)
    content_tag :span, pluralize(count, 'Answer'), id: "answersCount"
  end
end