require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test 'sign in successfully' do
    visit sign_in_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    find("input[type='submit']").click
    assert_text @user.email
    assert_current_path root_path
  end

  test 'sign in fails with invalid password' do
    visit sign_in_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: 'wrong-password'
    find("input[type='submit']").click
    assert_text 'Invalid email or password.'
    assert_current_path new_session_path
  end
end
