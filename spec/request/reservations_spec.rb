require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  before do
    @user = User.create(name: 'Miguel', email: 'example@test.com', password: '123456')
    @car = Car.create(name: 'Lamborguini', photo: 'Photo link', description: 'Really Nice car', price: 10_000)
    @reservation = Reservation.create(date: '2025-10-10', city: 'Manta', country: 'Australia', user: @user, car: @car)
    post api_login_path, params: { email: @user.email, password: @user.password }
    @token = JSON.parse(response.body)['token']
  end

  describe 'GET /index' do
    before do
      get api_reservations_path, headers: { Authorization: @token }
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all reservations dates' do
      expect(response.body).to include('2025-10-10')
    end

    it 'returns all reservations city names' do
      expect(response.body).to include('Manta')
    end

    it 'returns all reservations car names' do
      expect(response.body).to include('Lamborguini')
    end
  end

  describe 'POST /create' do
    before do
      @params = {
        city: 'Jipijapa',
        country: 'Ecuador',
        date: '2024-10-10',
        car_id: @car.id
      }
      post api_reservations_path, headers: { Authorization: @token }, params: @params
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
