require 'test_helper'

class UserCanMarkFavoriteGifTest < ActionDispatch::IntegrationTest

  def login_user
    User.create(username: "user",
                password: "password",
                role: 0)
    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test "regular user can mark a gif as favorite" do
    visit gifs_path
    
  end

end
