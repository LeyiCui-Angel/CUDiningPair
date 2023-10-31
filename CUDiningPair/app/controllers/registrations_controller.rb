class RegistrationsController < ApplicationController
  # redirect if logged in
  skip_before_action :require_login, only: [:new, :create, :verify]

  def new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:password] != params[:user][:password_confirmation]
      flash.now[:error] = 'Passwords do not match!'
      render 'new' and return
    end
   
    if params[:user][:uni] == ""
      flash.now[:error] = 'Uni cannot be empty.'
      render 'new' and return
    end

    # Automatically set the email value
    @user.email = "#{@user.uni}@columbia.edu"
  
    @user.verification_code = rand.to_s[2..7]  # Generate a 6-digit random number
    
    if @user.save
      UserMailer.send_verification_code(@user, @user.verification_code).deliver_now
      redirect_to verification_path
    else
      # Check if the 'uni' attribute has any errors
      if @user.errors.added?(:uni, :taken)
        flash.now[:error] = 'You have already registered with this UNI!'
      end
      render 'new'  # Assuming 'new' template is for user registration
    end
  end  
  
  def verify
    user = User.find_by(verification_code: params[:verification_code])
    if user
      user.update(is_verified: true)
      redirect_to new_sessions_path, notice: 'User verified!'
    else
      flash.now[:alert] = 'Invalid verification code. Please try again.'
      render :verify
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:uni, :password, :password_confirmation)
  end  
  
end
