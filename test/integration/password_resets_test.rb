require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  test 'resetting password invalidates all existing sessions' do
    user = create(:user)
    user.sessions.create!(ip: '127.0.0.1', user_agent: 'test-agent-1')
    user.sessions.create!(ip: '127.0.0.2', user_agent: 'test-agent-2')
    token = user.password_reset_token

    assert_difference -> { Session.where(user_id: user.id).count }, -2 do
      patch password_path(token), params: {
        password: 'new-password-123',
        password_confirmation: 'new-password-123',
      }
    end

    assert_redirected_to new_session_path
    assert_equal 'Password has been reset.', flash[:notice]
    assert user.reload.authenticate('new-password-123')
  end
end
