require 'test_helper'

class AdminGifsTest < ActionDispatch::IntegrationTest
  def login_admin
    User.create(username: "MyName", password: "MyPassword", role: 1)
    visit login_path
    fill_in "Username", with: "MyName"
    fill_in "Password", with: "MyPassword"
    click_button "Login"
  end

  test "logged in admin can generate gif" do
    login_admin

    visit new_admin_gif_path
    fill_in "search", with: "puppy"
    click_button "Generate Gif"
    assert page.has_content?("puppy")
  end


end
