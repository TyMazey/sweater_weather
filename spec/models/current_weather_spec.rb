require 'rails_helper'

RSpec.describe CurrentWeather do

  it 'exist' do
    forecast = CurrentWeather.new("denver,co", weather_stub)

    expect(forecast).to be_a(CurrentWeather)
  end

  it 'has attributes' do
    forecast = CurrentWeather.new("denver,co", weather_stub)

    expect(forecast.country).to eq("America")
    expect(forecast.time).to eq("02:56 PM, 13/04")
    expect(forecast.summary).to eq("Partly Cloudy")
    expect(forecast.icon).to eq("partly-cloudy-day")
    expect(forecast.temperature).to eq(63)
    expect(forecast.apparent_temperature).to eq(63)
    expect(forecast.humidity).to eq(63)
    expect(forecast.uv_index).to eq(6)
    expect(forecast.visibility).to eq(7.46)
    expect(forecast.today).to eq("Partly cloudy starting in the afternoon.")
    expect(forecast.tonight).to eq("Light rain on Monday, with high temperatures bottoming out at 55°F on Monday.")
  end
end
