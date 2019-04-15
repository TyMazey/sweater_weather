class AntipodeFacade < ForecastFacade


  def get_antipode
    anti_geocode = amypodeservice.antipode(get_location)
    anti_city = geocodeservice.get_address(anti_geocode)
  end

  def antipode_weather
    AntipodeWeather.new(get_antipode, get_forecast)
  end

  private

  def amypodeservice
    @amypodeservice ||= AmypodeService.new
  end
end
