require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information of a place' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast).to have_key(:current)
    expect(forecast[:current][:data]).to be_a(Hash)
    expect(forecast).to have_key(:daily)
    expect(forecast[:daily][:data]).to be_a(Array)
    expect(forecast).to have_key(:hourly)
    expect(forecast[:hourly][:data]).to be_a(Array)
  end
end
