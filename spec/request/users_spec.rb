require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(name: 'Test', email: 'test@example.com', password: 'password')
  end

  describe 'GET /users' do
    before do
      post '/login', params: { email: user.email, password: user.password }
      token = JSON.parse(response.body)['token']
      get '/users', headers: { 'Authorization' => "Bearer #{token}" }
    end

    it 'returns all users' do
      expect(response.body).to include(user.name)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns users' do
      expect(response.body).to include('Test')
    end

    it 'returns http unauthorized' do
      post '/login', params: { email: user.email, password: 'invalid' }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /users/:id' do
    before do
      post '/login', params: { email: user.email, password: user.password }
      token = JSON.parse(response.body)['token']
      get user_path(user.id), headers: { 'Authorization' => "Bearer #{token}" }
    end

    it 'returns user' do
      expect(response.body).to include(user.name)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns http unauthorized' do
      post '/login', params: { email: user.email, password: 'invalid' }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /users' do
    it 'creates a user' do
      post '/users', params: { name: 'Test', email: 'test@example.com', password: 'password' }
      expect(response).to have_http_status(:created)
    end

    it 'returns error when the params are missing' do
      post '/users', params: { name: 'Test', email: '', password: 'password' }
      expect(response.body).to include('"email":["can\'t be blank"]')
    end
  end
end
