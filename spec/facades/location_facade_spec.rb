require 'rails_helper'

RSpec.describe LocationFacade do
  it 'exist' do
    facade = LocationFacade.new("location")

    expect(facade).to be_a(LocationFacade)
  end

  describe 'instance methods' do
    describe 'get_location' do
      it 'returns location object based on citystate' do
        location = Location.create(citystate: "Denver, CO",
                                  latitude: "37.8267",
                                  longitude: "-122.4233",
                                  image_url: "https:\/\/live.staticflickr.com\/7830\/47499079331_34d03d300e_b.jpg")
        facade = ForecastFacade.new("Denver, CO")
        returned = facade.get_location

        expect(returned).to be_a(Location)
        expect(returned.citystate).to eq("Denver, CO")
        expect(returned.latitude).to eq("37.8267")
        expect(returned.longitude).to eq("-122.4233")
        expect(returned.longitude).to eq("-122.4233")
        expect(returned.image_url).to eq("https:\/\/live.staticflickr.com\/7830\/47499079331_34d03d300e_b.jpg")
      end

      it 'returns a location object for citys not in DB yet' do
        facade = ForecastFacade.new("Golden, CO")
        new_location = facade.get_location

        expect(new_location).to be_a(Location)
        expect(new_location.citystate).to eq("Golden, CO")
        expect(new_location.latitude).to eq("39.755543")
        expect(new_location.longitude).to eq("-105.2210997")
        expect(new_location.image_url).to eq("https://live.staticflickr.com/7865/47599375131_74b79765f2_b.jpg")
      end
    end
  end
end
