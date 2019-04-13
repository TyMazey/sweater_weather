require 'rails_helper'

RSpec.describe ForecastFacade do

  it 'exist' do
    facade = ForecastFacade.new

    expect(Facade).to be_a(ForecastFacade)
  end

  describe 'class methods' do
    describe 'get_forecast' do
      it 'returns a forcast object for the givin location' do
        forecast = ForecastFacade.get_forecast("Denver, CO")

        expect(forecast).to be_a(Forcast)
      end
    end
  end
end
