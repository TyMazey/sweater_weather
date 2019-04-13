require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:citystate)}
    it { should validate_presence_of(:latitude)}
    it { should validate_presence_of(:longitude)}
  end

  describe 'class methods' do
    describe 'forecast' do
      it 'returns the darksky forcast for the givin location' do
        response = Location.forecast("Denver,CO")

        expect(response).to be_a(Hash)
        expect(response).to have_key(:currently)
        expect(response).to have_key(:minutely)
        expect(response).to have_key(:hourly)
        expect(response).to have_key(:daily)
        expect(response[:daily][:data]).to be_a(Array)
      end
    end

    describe 'new_city' do
      it 'finds the latitude and logitude for a city not in the db' do
        new_location  = Location.new_city("Denver,CO")

        expect(new_location).to be_a(Location)
        expect(new_location.citystate).to eq("Denver,CO")
        expect(new_location.latitude).to eq("39.7392358")
        expect(new_location.longitude).to eq("-104.990251")
      end
    end
  end

  describe 'instance methods' do
    describe 'request_forcast' do
      it 'can return its current forcast' do
        location = Location.create(citystate: "Denver,CO",
                                   latitude: "39.7392358",
                                   longitude: "-104.990251")

        response = location.request_forcast

        expect(response).to be_a(Hash)
        expect(response).to have_key(:currently)
        expect(response).to have_key(:minutely)
        expect(response).to have_key(:hourly)
        expect(response).to have_key(:daily)
        expect(response[:daily][:data]).to be_a(Array)
      end
    end
  end
end
