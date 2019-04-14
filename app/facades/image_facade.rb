class ImageFacade < ForecastFacade

  def image_for_location
    location = get_location
    location.image
  end
end
