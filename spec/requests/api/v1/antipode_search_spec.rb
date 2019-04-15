require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information of a place' do

    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
  end
end
