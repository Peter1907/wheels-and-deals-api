require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'GET /login' do
    let(:user) do
      User.create(name: 'Test', email: 'test@example.com', password: 'password')
    end

    it 'returns token' do
      post '/login', params: { email: user.email, password: user.password }
      expect(response.body).to include('token')
    end

    it 'returns status code 200' do
      post '/login', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(200)
    end

    it 'returns http success' do
      post '/login', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unauthorized' do
      post '/login', params: { email: user.email, password: 'invalid' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
