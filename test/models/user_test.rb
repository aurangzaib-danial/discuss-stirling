require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    User.create(name: 'Sunny', email: 'a@a.com', password: '123456', private: true)
    assert User.last.private?
  end
end
