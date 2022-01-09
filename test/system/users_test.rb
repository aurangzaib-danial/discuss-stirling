require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "registering as a private user" do
    visit users_url
  
    assert_selector "h1", text: "Users"
  end
end
