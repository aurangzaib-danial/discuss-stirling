class AnswerPolicy < ApplicationPolicy
  def update?
    user == record.user if user
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
