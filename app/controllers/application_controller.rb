class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate

  private

  # Get current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end
  helper_method :current_user

  # Check if session is authed
  def authenticate
    redirect_to_auth unless current_user
  end

  def app_redirect_back
    if session[:auth_return_to]
      redirect_to session[:auth_return_to]
      session[:auth_return_to] = nil
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def redirect_to_auth
    session[:auth_return_to] = request.fullpath
    redirect_to new_sessions_url, danger: 'Please Login'
  end
end
