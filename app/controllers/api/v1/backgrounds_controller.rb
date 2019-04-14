class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = ImageFacade.new(params[:location])
    render json: ImageSerializer(facade.image_for_loaction)
  end
end
