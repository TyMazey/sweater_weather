require 'rails_helper'

RSpec.describe ImageFacade do

  it 'exist' do
    facade = ImageFacade.new("location")

    expect(facade).to be_a(ImageFacade)
  end

  describe 'instance methods' do
    describe 'image_for_loaction' do
      it 'returns an image object for the location' do
        facade = ImageFacade.new("location")

        expect(facade.image_for_loaction).to be_a(Image)
      end
    end
  end
end
