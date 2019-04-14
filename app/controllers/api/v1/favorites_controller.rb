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

  def index
    u = User.find_by(api_key: user_favorite[:api_key])
    if u
      favorites =  u.locations.map do |l|
        ForecastFacade.new(l.citystate).current_weather
      end
      render json: CurrentForecastSerializer.new(favorites), status: 200
    else
      render json: {}, status: 401
    end
  end

  def destroy
    u = User.find_by(api_key: user_favorite[:api_key])
    if u
      FavoriteFacade.new(u, user_favorite[:location]).remove_favorite
      favorites =  u.locations.map do |l|
        ForecastFacade.new(l.citystate).current_weather
      end
      render json: CurrentForecastSerializer.new(favorites), status: 200
    else
      render json: {}, status: 401
    end
  end

  private

  def user_favorite
    params.permit(:api_key, :location)
  end
end
