class FlickrService

  def get_image(location)
    json = get_json(request_image(location))
    json[:photos][:photo][0][:url_l]
  end

  private

  def request_image(location)
    conn.get("services/rest/") do |req|
      req.params[:method] = "flickr.photos.search"
      req.params[:api_key] = ENV['FLICKR_KEY']
      req.params[:accuracy] = "11"
      req.params[:safe_search] = "1"
      req.params[:tags] = "snow,clouds,sun,lake,nature,winter,trees"
      req.params[:format] = "json"
      req.params[:page] = "1"
      req.params[:per_page] = "1"
      req.params[:media] = "photos"
      req.params[:content_type] = "1"
      req.params[:extras] = "url_l"
      req.params[:lat] = location[:lat]
      req.params[:lon] = location[:lng]
      req.params[:nojsoncallback] = "1"
    end
  end

  def conn
    Faraday.new("https://api.flickr.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
