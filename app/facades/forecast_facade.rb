class ForecastFacade < LocationFacade

  def get_forecast
    @get_forecast ||= forecast_info(get_location)
  end

  def current_weather
    Rails.cache.fetch("current_weather#{@citystate}", expires_in: 1.hour) do
      CurrentWeather.new(@citystate, get_forecast)
    end
  end

  def daily_weather
    Rails.cache.fetch("daily_weather#{@citystate}", expires_in: 1.hour) do
      get_forecast[:daily][:data].each_with_index.map { |info, index| DailyWeather.new(index, info) }
    end
  end

  def hourly_weather
    Rails.cache.fetch("hourly_weather#{@citystate}", expires_in: 1.hour) do
      get_forecast[:hourly][:data].each_with_index.map { |info, index| HourlyWeather.new(index, info) }
    end
  end

  def forecast_info(location)
    @forecast_info ||= darkskyservice.forecast(location.latitude, location.longitude)
  end

  private

  def darkskyservice
    @darkskyservice ||= DarkskyService.new
  end
end
