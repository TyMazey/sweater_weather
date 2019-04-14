require 'rails_helper'

describe 'Favorite API' do
  it 'lets user add a favorite location' do
    user = User.create( email: "email", password: "pass", api_key: "abc")

    headers = {content_type: "application/json"}
    post "/api/v1/favorites", params: {
         "location": "Denver,CO",
         "api_key": "abc"
        }

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end

  it 'gets 401 with bad api key' do
    user = User.create( email: "email", password: "pass", api_key: "abc")

    headers = {content_type: "application/json"}
    post "/api/v1/favorites", params: {
         "location": "Denver,CO",
         "api_key": "badkey"
        }

    expect(response.status).to eq(401)
  end
end
