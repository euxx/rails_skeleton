require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = build(:user)
  end

  test 'sign up successfully' do
    visit sign_up_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    fill_in 'user[password_confirmation]', with: @user.password
    find("input[type='submit']").click
    assert_current_path root_path
  end
end
