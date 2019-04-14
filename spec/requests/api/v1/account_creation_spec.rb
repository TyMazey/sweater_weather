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

    expect(response.body).to have_key(:api_key)
  end
end
