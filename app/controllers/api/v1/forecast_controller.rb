class Api::V1::ForecastController < ApplicationController

  def index
    render :json ForcastSerializer.new()
  end
end
