class Location < ApplicationRecord
  validates_presence_of :citystate
  validates_presence_of :latitude
  validates_presence_of :longitude


  def self.forecast(citystate)
    location = Location.find_by(citystate: citystate)
    if location
      location.request_forcast
    else
      location = Location.new_city(citystate)
      location.request_forcast
    end
  end

  def self.new_city(citystate)
    info = geoservice.get_geocode(citystate)
    Location.create(citystate: citystate,
                    latitude: info[:lat],
                    longitude: info[:lng])
  end

  private

  def geoservice
    @geoservice ||= GeocodeService.new
  end
end
