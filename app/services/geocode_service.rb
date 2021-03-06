class GeocodeService

  def get_geocode(location)
    location = get_json(geocode_request(location))
    location[:results][0][:geometry][:location]
  end

  def get_address(location)
    address = get_json(address_request(location))
    only_citystate(address[:plus_code][:compound_code])
  end

  private

  def address_request(latlng)
    conn.get("geocode/json") do |req|
      req.params[:latlng] = "#{latlng[:lat]},#{latlng[:long]}"
    end
  end

  def geocode_request(location)
    conn.get("geocode/json") do |req|
      req.params[:address] = location
    end
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:key] = ENV['GEOCODE_API']
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def only_citystate(compound_code)
    code_city_state = compound_code.split(",")
    code_city = code_city_state[0].split(" ")
    code_city[1] + "," + code_city_state[1]
  end
end
