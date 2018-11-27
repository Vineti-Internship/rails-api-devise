module V1
  class UsersController < ApplicationController
    def index
      @users = User.all
      
      render json: @users
    end

    def create
      @user = User.new(user_params)
      authorize @user

      if @user.save
        render json: @user.as_json(only: [:id, :email])
      else
        render json: @user.errors
      end
    end
    
    def destroy
    
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end