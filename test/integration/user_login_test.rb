require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def login_user
    User.create(username: "MyName", password: "MyPassword")
    visit login_path
    fill_in "Username", with: "MyName"
    fill_in "Password", with: "MyPassword"
    click_button "Login"
  end

  test "a registered user can log into their account" do
    login_user

    assert page.has_content?("Welcome, MyName!")
  end
  
end
