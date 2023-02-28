require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /index' do
    before do
      @user = FactoryBot.create(:user)
      user_login(@user)
      get '/reservations'
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
