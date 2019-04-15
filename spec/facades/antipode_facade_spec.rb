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

        expect(facade.get_antipode).to eq("")
      end
    end
  end
end
