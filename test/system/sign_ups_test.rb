require "application_system_test_case"

class SignUpsTest < ApplicationSystemTestCase
  test "Sign up as a private user" do
    visit sign_up_path

    fill_in "user_name", with: "Aurangzaib Khan"
    fill_in "user_email", with: "a@a.com"
    fill_in "user_password", with: "123456"
    choose("user_private_1")

    click_button "Sign up"

    assert_content "Private account"
  end
end
