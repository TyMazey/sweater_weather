class Api::V1::ForecastController < ApplicationController

  def index
    facade = ForecastFacade.new(params[:location]).get_forecast
    render json: {current: CurrentForecastSerializer.new(facade.current_weather),
                  daily: DailyForecastSerializer.new(facade.daily_weather),
                  hourly: HourlyForecastSerializer.new(facade.hourly_weather)}
  end
end
