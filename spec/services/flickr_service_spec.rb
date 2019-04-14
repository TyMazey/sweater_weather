require 'rails_helper'

RSpec.describe FlickrService do

  it 'exist' do
    service = FlickrService.new

    expect(service).to be_a(FlickrService)
  end

  describe 'instance methods' do
    describe 'get_image' do
      it 'gets an image url for a location' do
        service = FlickrService.new

        image = service.get_image({lat: "39.755543", long: "-105.2210997"})

        expect(image).to be_a(String)
        binding.pry
      end
    end
  end
end
