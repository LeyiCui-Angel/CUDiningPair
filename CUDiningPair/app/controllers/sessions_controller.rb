class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(uni: params[:uni])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to some_dashboard_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Login failed.'
      render :new
    end
  end  

  def destroy
  end
end
