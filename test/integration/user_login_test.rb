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
    save_and_open_page
    assert page.has_content?("Welcome, MyName!")
  end

  test "a registered user cannot submit an incorrect password" do
    User.create(username: "MyName", password: "MyPassword")

    visit login_path

    fill_in "Username", with: "MyName"
    fill_in "Password", with: "MyPasswordiswrong"
    click_button "Login"

    assert page.has_content?("Nope....that's not right. Try again.")
  end

  test "an unregistered user cannot log in" do
    visit login_path

    fill_in "Username", with: "MyNamedoesntexist"
    fill_in "Password", with: "MyPasswordiswrong"
    click_button "Login"

    assert page.has_content?("Nope....that's not right. Try again.")
  end


    test "a registered user can log out" do
      login_user

      assert page.has_content?("Welcome, MyName!")

      click_link "Logout"

      save_and_open_page
      assert_equal login_path, current_path
      assert page.has_content?("You've been logged out")
    end

end
