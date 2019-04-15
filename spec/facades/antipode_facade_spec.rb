require 'rails_helper'

RSpec.describe AntipodeFacade  do

  it 'exist' do
    facade = AntipodeFacade.new("location")

    expect(facade).to be_a(AntipodeFacade)
  end

  describe 'instance methods' do
    describe 'get antipode' do
      it "returns the antipode of a givin city" do
        facade = AntipodeFacade.new("hongkong")

        expect(facade.get_antipode).to eq("Cerrillos, Jujuy")
      end
    end

    describe 'antipode weather' do
      it 'returns an antipode weather object' do
        facade = AntipodeFacade.new("hongkong")

        returned = facade.antipode_weather

        expect(returned).to be_a(AntipodeWeather)
        expect(returned.location_name).to eq("Cerrillos, Jujuy")
      end
    end
  end
end
