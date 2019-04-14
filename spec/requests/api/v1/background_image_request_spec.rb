require 'rails_helper'

describe 'Image API' do
  it 'returns an image url' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)
    expect(image).to have_key(:data)
  end
end
