require 'rails_helper'

RSpec.describe GeocodeService do
  it 'exist' do
    service = GeocodeService.new

    expect(service).to be_a(GeocodeService)
  end

  describe 'instance methods' do
    describe 'get_geocode' do
      it 'can return the latitude and longitude for a location' do
        service = GeocodeService.new

        response = service.get_geocode("Denver,CO")

        expect(response).to be_a(Hash)
        expect(response).to have_key(:lat)
        expect(response).to have_key(:lng)
      end
    end
  end
end
