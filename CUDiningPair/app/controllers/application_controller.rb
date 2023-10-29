class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user, :logged_in?

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path # Redirects to the login path if not logged in
    end
  end

  def logged_in?
    current_user.present? # Checks if current_user exists
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # Caches the current_user to avoid multiple DB lookups
    rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil # If the user isn't found, clear the session
  end
end

