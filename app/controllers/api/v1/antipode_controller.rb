class Api::V1::AntipodeController < ApplicationController

  def show
    AntipodeFacade.new(params[:location])
    render json: AntipodeWeatherSerializer.new(facade.antipode_weather)
  end
end
