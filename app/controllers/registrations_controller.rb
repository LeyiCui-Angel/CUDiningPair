class RegistrationsController < ApplicationController
  # redirect if logged in
  skip_before_action :require_login, only: [:new, :create, :check_verification, :verify]
  helper_method :current_user

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
  
    #@user.verification_code = rand.to_s[2..7]  # Generate a 6-digit random number
    
    if @user.save
      # UserMailer.send_verification_code(@user, @user.verification_code).deliver_now
      # redirect_to verification_path
      redirect_to login_path
    end
    rescue ActiveRecord::RecordNotUnique => e
      # Handle the unique constraint violation
      flash.now[:error] = 'You have already registered with this UNI!'
      render 'new'  # Rendering the 'new' template with an error message
  end
  
#   def check_verification
#     user = User.find_by(verification_code: params[:registration][:verification_code])
#     if user
#       user.update(verified_at: Time.now)
#       redirect_to login_path
#     else
#       flash.now[:error] = 'Invalid verification code. Please try again.'
#       render :verify
#     end
#   end

#   def verify
#   end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:uni, :password, :password_confirmation, :verification_code)
  end  
  
end
