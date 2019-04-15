class AntipodeFacade < ForecastFacade


  def get_antipode
    anti_geocode = amypodeservice.antipode(get_location)
    @citystate = geocodeservice.get_address(anti_geocode)
  end

  def antipode_weather(original_search)
    AntipodeWeather.new(get_antipode, get_forecast, original_search)
  end

  private

  def amypodeservice
    @amypodeservice ||= AmypodeService.new
  end
end
