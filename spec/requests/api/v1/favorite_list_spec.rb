require 'rails_helper'

describe 'Favorite list API' do
  it 'lets user add a favorite location' do
    user = User.create( email: "email", password: "pass", api_key: "abc")
    location = Location.create(citystate: "denver,co", longitude: "1", latitude: "1", image_url: "image")
    Favorite.create(user: user, location: location)

    headers = {content_type: "application/json"}
    get "/api/v1/favorites", params: {
         "location": "Denver,CO",
         "api_key": "abc"
        }

    expect(response).to be_successful
    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data][0][:attributes][:address]).to eq("denver,co")
  end

  it 'gets 401 with bad api key' do
    user = User.create( email: "email", password: "pass", api_key: "abc")

    headers = {content_type: "application/json"}
    get "/api/v1/favorites", params: {
         "location": "Denver,CO",
         "api_key": "badkey"
        }

    expect(response.status).to eq(401)
  end
end
