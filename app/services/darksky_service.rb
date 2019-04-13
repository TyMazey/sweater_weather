class DarkskyService

  def forcast(lat, long)
    get_json(forcast_request(lat, long))
  end

  private

  def forcast_request(lat, long)
    conn.get("#{lat},#{long}") do
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/b0d2ec981f7d8e69000e14dbf6f264c4/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
