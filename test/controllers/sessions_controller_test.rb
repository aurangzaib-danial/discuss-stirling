require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    login users(:regular)
    get login_path
    assert_redirected_to root_path
  end
end
