require 'rails_helper'

RSpec.describe ForecastFacade do

  it 'exist' do
    facade = ForecastFacade.new("Denver, CO")

    expect(facade).to be_a(ForecastFacade)
  end

  describe 'instance methods' do
    describe '.forecast_info' do
      it 'returns  data for a location' do
        location = Location.create(citystate: "Denver,CO",
                                  latitude: "37.8267",
                                  longitude: "-122.4233")
        facade = ForecastFacade.new("Denver,CO")

        response = facade.forecast_info(location)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:currently)
        expect(response).to have_key(:minutely)
        expect(response).to have_key(:hourly)
        expect(response).to have_key(:daily)
        expect(response[:daily][:data]).to be_a(Array)
      end
    end

    describe 'current_weather' do
      it 'returns a  object for the location' do
        facade = ForecastFacade.new("Denver, CO")
        forecast = facade.current_weather

        expect(forecast).to be_a(CurrentWeather)
      end
    end

    describe 'daily_weather' do
      it 'returns an array of daily weather objects' do
        forecast = ForecastFacade.new("Denver, CO")

        result = forecast.daily_weather

        expect(result).to be_a(Array)
        expect(result[0]).to be_a(DailyWeather)
      end
    end

    describe 'hourly_weather' do
      it 'returns an array of hourly weather objects' do
        forecast = ForecastFacade.new("Denver, CO")

        result = forecast.hourly_weather

        expect(result).to be_a(Array)
        expect(result[0]).to be_a(HourlyWeather)
      end
    end
  end
end
