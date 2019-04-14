class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = ImageFacade.new(params[:location])
    render json: ImageSerializer.new(facade.image_for_location)
  end
end
