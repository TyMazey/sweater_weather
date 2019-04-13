require 'rails_helper'

RSpec.describe DarkskyService do
  it 'exsist' do
    service = DarkskyService.new

    expect(service).to be_a(DarkskyService)
  end

  describe 'instance methods' do
  end
end
