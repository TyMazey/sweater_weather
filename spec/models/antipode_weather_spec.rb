require 'rails_helper'

RSpec.describe AntipodeWeather do
  it 'exist' do
    anti = AntipodeWeather.new("location", {}, "original")

    expect(anti).to be_a(AntipodeWeather)
  end

  it 'has attribnutes' do
    anti = AntipodeWeather.new("location", {}, "original")

    expect(anti.location_name).to eq("location")
  end
end
