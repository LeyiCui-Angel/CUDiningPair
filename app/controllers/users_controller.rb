class UsersController < ApplicationController
    # before_action :set_user, only: [:show]
    
    def show
      id = params[:id]
      @user = User.find(id)
    end

        
    def index

    end

    def update
      @user = User.find(params[:id])
      
      if @user.update(user_params)
        flash[:notice] = "#{@user.name} was successfully updated."
        redirect_to user_path(@user)
      else
        flash.now[:alert] = "Error updating user."
        render :edit
      end
    end
  
    def new
      # Default: render 'new' template
    end

    def edit
      @user = User.find(params[:id])
    end

    def verification
      # Logic for verification page (if any)
    end

    private
    def user_params
      # Only permit password and password confirmation if they are present in the params
      if params[:user][:password].present?
        params.require(:user).permit(:name, :gender, :mbti, :password, :password_confirmation)
      else
        params.require(:user).permit(:name, :gender, :mbti)
      end
    end
    
  
    # private
  
    # def set_user
    #   @user = User.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
    #   flash[:alert] = "User not found."
    #   redirect_to root_path
    # end
  end