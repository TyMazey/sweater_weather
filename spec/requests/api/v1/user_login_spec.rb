require 'rails_helper'

describe 'sessions api' do
  it 'allows users to login' do
    User.create(email: "whatever@example.com", password: "password")
    headers = {content_type: "application/json"}
    post "/api/v1/sessions", params: {
  "email": "whatever@example.com",
  "password": "password"
  }

  expect(response).to be_successful
  expect(response.status).to eq(200)
  json = JSON.parse(response.body, symbolize_names: true)

  expect(json).to have_key(:api_key)
  end
end
