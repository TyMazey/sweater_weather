class AntipodeWeather
  attr_reader :location_name,
              :id,
              :search_location

  def initialize(location, forecast_info, original)
    @id = 1
    @location_name = location
    @search_location = original
    @forecast_info = forecast_info
  end

  def forecast
    {
      summary: @forecast_info[:currently][:summary],
      current_temperature: @forecast_info[:currently][:temperature].to_i
    }
  end
end
