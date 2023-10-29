class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  
  private
  
  def require_login
    redirect_to login_path unless logged_in?
  end
  
  def logged_in?
    # Your logic for checking if a user is logged in, usually you check if there's a current_user
    # Example: !current_user.nil?
  end
  
  # You would have a method to define 'current_user' based on session or cookie
  # def current_user
  #   # Example: User.find(session[:user_id]) if session[:user_id]
  # end
end
