class Api::V1::Antipode < ApplicationController

  def show
    AntipodeFacade.new(params[:location])
  end
end
