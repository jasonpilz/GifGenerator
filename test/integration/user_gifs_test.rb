require 'test_helper'

class UserGifsTest < ActionDispatch::IntegrationTest
  def login_user
    User.create(username: "user",
                password: "password",
                role: 0)
    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test "user_sees_index_of_gifs" do
    login_user
    category = Category.create(title: "dog")
    Gif.create(category_id: category.id,
               image_path: "https://media.giphy.com/media/yburpnPcPzBYc/giphy.gif")
    visit gifs_path
    assert page.has_content?("dog")
  end
end
