require 'rails_helper'

RSpec.describe DarkskyService do
  it 'exsist' do
    service = AmypodeService.new

    expect(service).to be_a(AmypodeService)
  end

  describe 'instance methods' do
    describe '.antipode' do
      it 'returns  lat and long for the antipode of givin lat and long' do
        service = AmypodeService.new
        location = Location.create(citystate: "hongkong", latitude: "27", longitude: "-82")

        response = service.antipode(location)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:lat)
        expect(response).to have_key(:long)
      end
    end
  end
end
