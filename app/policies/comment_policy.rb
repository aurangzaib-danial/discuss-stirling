class CommentPolicy < ApplicationPolicy
  def update?
    user == record.commentator
  end

  def edit?
    update?
  end
end
