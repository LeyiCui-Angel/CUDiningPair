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
      @user.update_attributes(name: params[:name], gender: params[:gender], mbti: params[:mbti])
      @user.update_attribute(:uni, params[:uni]) if params[:uni].present?
      
      if @user
        flash[:notice] = "#{@user.name} was successfully updated."
        redirect_to user_path(@user)
      else
        flash[:alert] = "Error updating user."
        render :edit
      end
    end
  
    def new
      # Default: render 'new' template
    end

    def edit
      @user = User.find(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:uni, :name, :gender, :mbti)
    end
  
    # private
  
    # def set_user
    #   @user = User.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
    #   flash[:alert] = "User not found."
    #   redirect_to root_path
    # end
  end