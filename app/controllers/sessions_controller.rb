class SessionsController < ApplicationController
  before_action :require_blank_user_session, only: [:new, :create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: 'Try again later.' }

  def new
  end

  def create
    if user = User.authenticate_by(session_params)
      start_new_session_for(user)
      redirect_to after_authentication_url
    else
      redirect_to :new
    end
  end

  def destroy
    terminate_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
