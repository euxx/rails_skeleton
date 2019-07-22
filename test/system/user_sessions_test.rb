require "application_system_test_case"

class UserSessionsTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test 'sign in successfully' do
    visit sign_in_path
    fill_in 'user_session[email]', with: @user.email
    fill_in 'user_session[password]', with: @user.password
    find("input[type='submit']").click
    assert_current_path root_path
  end
end
