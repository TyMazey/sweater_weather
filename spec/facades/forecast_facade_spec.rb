require 'rails_helper'

RSpec.describe ForecastFacade do

  it 'exist' do
    facade = ForecastFacade.new("Denver, CO")

    expect(facade).to be_a(ForecastFacade)
  end

  describe 'instance methods' do

    describe '.forcast_info' do
      it 'returns forcast data for a location' do
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

    describe 'get_location' do
      it 'returns location object based on citystate' do
        location = Location.create(citystate: "Denver, CO",
                                  latitude: "37.8267",
                                  longitude: "-122.4233")
        facade = ForecastFacade.new("Denver, CO")
        returned = facade.get_location

        expect(returned).to be_a(Location)
        expect(returned.citystate).to eq("Denver, CO")
        expect(returned.latitude).to eq("37.8267")
        expect(returned.longitude).to eq("-122.4233")
      end

      it 'returns a location object for citys not in DB yet' do
        facade = ForecastFacade.new("Golden, CO")
        new_location = facade.get_location

        expect(new_location).to be_a(Location)
        expect(new_location.citystate).to eq("Golden, CO")
        expect(new_location.latitude).to eq("39.755543")
        expect(new_location.longitude).to eq("-105.2210997")
      end
    end

    describe 'current_weather' do
      it 'returns a forcast object for the location' do
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
