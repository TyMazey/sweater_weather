class AntipodeWeather
  attr_reader :location_name

  def initialize(location, forcast_info)
    @location_name = location
  end

  def forecast
    {
      summary: "hold",
      current_temperature: "hold"
    }
  end
end
