class GeocodeService

  def get_geocode(location)
    location = get_json(geocode_request(location))
    location[:results][0][:geometry][:location]
  end

  private

  def geocode_request(location)
    conn.get("geocode/json") do |req|
      req.params[:address] = location
      req.params[:key] = ENV['GEOCODE_API']
    end
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
