class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_session

  private

  def current_user
    @current_user ||= current_user_session&.user
  end

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def last_request_update_allowed?
    false
  end

  def require_sign_in
    redirect_to root_path, notice: 'Require sign in' unless current_user
  end

  def require_blank_user_session
    redirect_to root_path, notice: 'Already signed in' if current_user
  end
end
