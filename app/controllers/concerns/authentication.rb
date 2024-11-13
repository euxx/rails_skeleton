module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :authenticated?, :current_user
  end

  private

  def authenticated?
    current_session
  end

  def require_authentication
    current_session || request_authentication
  end

  def current_session
    Current.session ||= find_session_by_cookie
  end

  def find_session_by_cookie
    Session.find_by(id: cookies.signed[:session_id])
  end

  def request_authentication
    session[:return_to_after_authenticating] = request.url
    redirect_to new_session_path
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end

  def current_user
    @current_user ||= current_session&.user
  end

  def require_sign_in
    redirect_to root_path, notice: 'Require sign in' unless current_user
  end

  def require_blank_user_session
    redirect_to root_path, notice: 'Already signed in' if current_user
  end

  def start_new_session_for(user)
    user.sessions.create!(user_agent: request.user_agent, ip: request.remote_ip).tap do |session|
      Current.session = session
      cookies.signed.permanent[:session_id] = { value: session.id, httponly: true, same_site: :lax }
    end
  end

  def terminate_session
    current_session&.destroy
    cookies.delete(:session_id)
  end
end
