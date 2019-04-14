require 'rails_helper'

RSpec.describe DailyWeather do

  it 'exist' do
    forecast = DailyWeather.new(1, weather_stub[:daily][:data][0])

    expect(forecast).to be_a(DailyWeather)
  end

  it 'has attributes' do
    forecast = DailyWeather.new(1, weather_stub[:daily][:data][0])

    expect(forecast.icon).to eq("partly-cloudy-day")
    expect(forecast.precip_probibility).to eq(8)
    expect(forecast.precip_type).to eq("rain")
    expect(forecast.temp_high).to eq(63)
    expect(forecast.temp_low).to eq(50)
  end
end
