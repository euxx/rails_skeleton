class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_session, :set_raven_context

  private

  def current_user
    @current_user ||= current_user_session&.user
  end

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def require_blank_user_session
    redirect_to root_path if current_user
  end

  def set_raven_context
    Raven.user_context(id: current_user&.id, ip_address: request.ip)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
