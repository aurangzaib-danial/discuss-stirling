require 'test_helper'

class AnswerPolicyTest < ActiveSupport::TestCase
  test "user can update their answers" do
    policy = Pundit.policy! users(:one), answers(:one)
    assert policy.update?
  end

  test "user cannot update other people answers" do
    policy = Pundit.policy! users(:two), answers(:one)
    assert_not policy.update?
  end
end