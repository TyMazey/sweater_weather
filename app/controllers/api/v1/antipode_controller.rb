class Api::V1::AntipodeController < ApplicationController

  def show
    facade = AntipodeFacade.new(params[:location])
    render json: AntipodeWeatherSerializer.new(facade.antipode_weather(params[:location]))
  end
end
