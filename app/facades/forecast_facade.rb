class ForecastFacade

  def initialize(citystate)
    @citystate = citystate
  end

  def get_forecast
    @get_forecast ||= forecast_info(get_location)
  end

  def current_weather
    CurrentWeather.new(@citystate, get_forecast)
  end

  def daily_weather
    get_forecast[:daily][:data].each_with_index.map { |info, index| DailyWeather.new(index, info) }
  end

  def hourly_weather
    get_forecast[:hourly][:data].each_with_index.map { |info, index| HourlyWeather.new(index, info) }
  end

  def get_location
    location = Location.find_by(citystate: @citystate)
    if location
      return location
    else
      location_data = geocodeservice.get_geocode(@citystate)
      location = Location.create!(citystate: @citystate,
        latitude: location_data[:lat],
        longitude: location_data[:lng])
      end
      return location
    end

    def forecast_info(location)
      @forecast_info ||= darkskyservice.forecast(location.latitude, location.longitude)
    end

  private

  def darkskyservice
    @darkskyservice ||= DarkskyService.new
  end

  def geocodeservice
    @geocodeservice ||= GeocodeService.new
  end
end
