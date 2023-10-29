class SessionsController < ApplicationController
  # redirect if logged in
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(uni: params[:session][:uni])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # Create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end  

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_url
  end  
end
