require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "cant access sign up if account not selected" do
    get new_user_registration_path
    assert_redirected_to users_select_account_path
  end

  test "cant access sign up if account is not specified correctly" do
    get new_user_registration_path(account: "admin")
    assert_redirected_to users_select_account_path
  end

  test "can access sign up page with proper account" do
    get new_user_registration_path(account: "private")
    assert_response :success
  end
end
