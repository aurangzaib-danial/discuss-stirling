class QuestionPolicy < ApplicationPolicy

  def vote?
    user.present? && user != record.questioner
  end

  def update?
    user == record.questioner
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
end
