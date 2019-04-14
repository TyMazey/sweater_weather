require 'rails_helper'

describe 'sessions api' do
  it 'allows users to login' do
    User.create(email: "whatever@example.com", password: "password")
    headers = {content_type: "application/json"}
    post "/api/v1/sessions", params: {
  "email": "whatever@example.com",
  "password": "password"
  }

  end
end
