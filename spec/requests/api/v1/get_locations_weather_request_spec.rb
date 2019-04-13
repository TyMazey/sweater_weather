require 'rails_helper'

describe 'Internal API' do
  describe 'api/v1/forecast' do
    it 'returns user forcast data for the givin location' do

      get '/api/v1/forecast?location=denver,co'

      response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_a(Hash)
      expect(response[:data])
    end
  end
end
