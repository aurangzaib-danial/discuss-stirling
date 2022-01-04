require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name must be present" do
    user = User.new
    user.valid?
    assert user.errors[:name].present?
  end
  test "user's name is not required if user is private " do
    user = User.new(private: true)
    user.valid?
    assert_not user.errors[:name].any?
  end
end
