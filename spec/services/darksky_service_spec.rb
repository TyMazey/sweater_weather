require 'rails_helper'

RSpec.describe DarkskyService do
  it 'exsist' do
    service = DarkskyService.new

    expect(service).to be_a(DarkskyService)
  end

  describe 'instance methods' do
    describe '.forecast' do
      it 'returns  data for a location' do
        service = DarkskyService.new

        response = service.forecast("37.8267","-122.4233")

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
