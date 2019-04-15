class AmypodeService

  def antipode(location)
    get_json(request_antipode(location))
  end

  def request_antipode(location)
    conn.get("antipodes") do |req|
      req.params[:lat] = location.latitude
      req.params[:long] = location.longitude
    end
  end

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers[:api_key] = ENV['MIKE_API']
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
