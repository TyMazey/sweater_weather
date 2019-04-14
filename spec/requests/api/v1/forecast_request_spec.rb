require 'rails_helper'

describe 'Internal API' do
  it 'returns user  data for the giving location' do

  get '/api/v1/forecast?location=denver,co'
  binding.pry
    expect(response).to be_succesful

    response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_a(Hash)
    expect(response[:data])
  end
end
