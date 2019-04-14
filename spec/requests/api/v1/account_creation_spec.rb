require 'rails_helper'

describe 'Login API' do
  it 'lets visitors create an account' do

    headers = {content_type: "application/json"}
    post "/api/v1/users", params: {
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}

    expect(response).to be_successful
    expect(response.status).to eq(201)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:api_key)
  end
end
