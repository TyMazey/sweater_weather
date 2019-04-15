require 'rails_helper'

RSpec.describe AntipodeFacade  do

  it 'exist' do
    facade = AntipodeFacade.new("location")

    expect(facade).to be_a(AntipodeFacade)
  end

  describe 'instance methods' do
    
  end
end
