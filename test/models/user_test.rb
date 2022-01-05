require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user's name is required if user's account is public " do
    user = User.new(account: "public_account")
    user.valid?
    assert user.errors[:name].any?
  end
end
