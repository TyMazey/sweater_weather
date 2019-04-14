class Api::V1::SessionsController < ApplicationController

  def create
    u = User.find_by(email: user_info[:email])
    if u&.authenticate(user_info[:password])
      session[:user_id] = u.id
      render json: { api_key: u.api_key }, status: 200
    end
  end


  private
  def user_info
    params.permit(:email, :password)
  end
end
