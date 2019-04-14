class DarkskyService

  def forecast(lat, long)
    get_json(forecast_request(lat, long))
  end

  private

  def forecast_request(lat, long)
    conn.get("#{lat},#{long}") do
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
