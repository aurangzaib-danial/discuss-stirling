class FollowPolicy < ApplicationPolicy
  def destroy?
    user == record.user
  end
end