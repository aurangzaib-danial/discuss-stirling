require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "registering as a private user" do
    visit users_select_account_path

    click_on "Create Private"

    fill_in "Email", with: "a@a.com"
    fill_in "Password", with: "123456"

    click_button "Sign up"
  
    assert_text "Private account"
  end
end
