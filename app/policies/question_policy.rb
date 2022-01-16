class QuestionPolicy < ApplicationPolicy

  def vote?
    true unless user == question.questioner if user
  end

  def update?
    user == question.questioner if user
  end

  def edit?
    update?
  end

  def destroy?
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
