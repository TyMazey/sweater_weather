class AntipodeFacade < LocationFacade


  def get_antipode
    anti_geocode = amypodeservice.antipode(get_location)
    anti_city = geocodeservice.get_address(anti_city)
  end
end
