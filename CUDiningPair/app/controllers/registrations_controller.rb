class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    
    # Automatically set the email value
    @user.email = "#{@user.uni}@columbia.edu"
  
    @user.verification_code = rand.to_s[2..7]  # Generate a 6-digit random number
    
    if @user.save
      UserMailer.send_verification_code(@user, @user.verification_code).deliver_now
      redirect_to verification_path
    else
      # Handle the error case
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
