class Api::V1::UsersController < ApplicationController

  def create
      if User.validate_new(new_user_params)
        render json: { api_key: User.find_by(email: params[:email]).api_key }, status: 201
      end
  end

  private

  def new_user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
