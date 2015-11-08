require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  def login_admin
    User.create(username: "MyName", password: "MyPassword", role: 1)
    visit login_path
    fill_in "Username", with: "MyName"
    fill_in "Password", with: "MyPassword"
    click_button "Login"
  end

  test 'logged in admin can add a category' do
    login_admin
    visit new_admin_category_path
    fill_in "Title", with: "hippo"
    click_button "Create Category"
    assert_equal admin_categories_path, current_path
    assert page.has_content?("hippo")
  end

  test 'logged in admin can delete a category' do
    login_admin

    visit new_admin_category_path
    fill_in "Title", with: "hippo"
    click_button "Create Category"
    assert_equal admin_categories_path, current_path
    assert page.has_content?("hippo")

    visit admin_categories_path
    assert page.has_content?("hippo")
    click_link("cat_hippo")
    assert_equal admin_categories_path, current_path

    refute page.has_content?("puppy")
  end
end
