module V1
  class SessionsController < ApplicationController
    def create
      @user = User.where(email: params[:email]).first

      if @user&.valid_password?(params[:password])
        render json: @user.as_json(only: [:id, :email, :authentication_token])
      else
        head(:unauthorized)
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.authentication_token = nil
      render json: status: :created
    end
  end
end