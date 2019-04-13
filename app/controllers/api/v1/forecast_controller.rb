class Api::V1::ForecastController < ApplicationController

  def index
    render :json ForcastSerializer.new(ForecastFacade.get_forcast(params[:location]))
  end
end
