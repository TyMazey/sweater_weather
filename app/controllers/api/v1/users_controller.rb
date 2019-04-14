class Api::V1::UsersController < ApplicationController

  def create
    User.validate_new(new_user_params)
  end

  private

  def new_user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
