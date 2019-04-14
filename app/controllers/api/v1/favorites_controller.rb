class Api::V1::FavoritesController < ApplicationController

  def create
    u = User.find_by(api_key: user_favorite[:api_key])
    if u
      f = FavoriteFacade.new(u, user_favorite[:location])
      f.create_favorite
      render json: {}, status: 201
    else
      render json: {}, status: 401
    end
  end

  private

  def user_favorite
    params.permit(:api_key, :location)
  end
end
