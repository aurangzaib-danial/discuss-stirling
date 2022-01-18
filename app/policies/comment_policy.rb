class CommentPolicy < ApplicationPolicy
  def update?
    user == record.commentator
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
