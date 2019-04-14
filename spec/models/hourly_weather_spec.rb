require 'rails_helper'

RSpec.describe HourlyWeather do

  it 'exist' do
    forecast = HourlyWeather.new(1, weather_stub[:hourly][:data][0])

    expect(forecast).to be_a(HourlyWeather)
  end

  it 'has attributes' do
    forecast = HourlyWeather.new(1, weather_stub[:hourly][:data][0])

    expect(forecast.time).to eq("02 PM")
    expect(forecast.temperature).to eq(62)
  end
end
