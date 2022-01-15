require 'test_helper'

class QuestionPolicyTest < ActiveSupport::TestCase
  test "cannot vote question if the user themselves created the question" do
    policy =  Pundit.policy! users(:one), questions(:one)
    assert_not policy.vote?
  end

  test "can vote on some one else's question" do
    policy =  Pundit.policy! users(:two), questions(:one)
    assert policy.vote?
  end

  test "user can update their own question" do
    policy =  Pundit.policy! users(:one), questions(:one)
    assert policy.update?
  end

  test "cannot update some one else's question" do
    policy =  Pundit.policy! users(:two), questions(:one)
    assert_not policy.update?
  end



end
