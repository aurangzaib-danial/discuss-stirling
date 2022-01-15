class QuestionPolicy < ApplicationPolicy

  def vote?
    true unless user == question.questioner
  end

  def update?
    user == question.questioner
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private
  def question
    record
  end
end
