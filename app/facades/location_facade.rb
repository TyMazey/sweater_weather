class LocationFacade
  def initialize(citystate)
    @citystate = citystate
  end

  def get_location
    location = Location.find_by(citystate: @citystate)
    if location
      return location
    else
      location_data = geocodeservice.get_geocode(@citystate)
      image_url = flickrservice.get_image(location_data)
      location = Location.create!(citystate: @citystate,
        latitude: location_data[:lat],
        longitude: location_data[:lng],
        image_url: image_url)
    end
    return location
  end

  private

  def geocodeservice
    @geocodeservice ||= GeocodeService.new
  end

  def flickrservice
    @flickrservice ||= FlickrService.new
  end

end
