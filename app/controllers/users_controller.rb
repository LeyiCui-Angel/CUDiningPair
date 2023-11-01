class UsersController < ApplicationController
    before_action :set_user, only: [:show]
  
    def show
      # @user is set by set_user
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "User not found."
      redirect_to root_path
    end
  end  