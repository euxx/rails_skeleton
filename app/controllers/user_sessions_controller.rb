class UserSessionsController < ApplicationController
  before_action :require_blank_user_session, only: [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      ahoy.authenticate(current_user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session&.destroy
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
