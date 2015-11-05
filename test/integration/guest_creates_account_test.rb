require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test "a new user can create an account" do
     visit new_user_path
     fill_in "Username", with: "MyName"
     fill_in "Password", with: "MyPassword"
     click_button "Create Account"
     assert page.has_content?("Welcome, MyName!")
   end
end
