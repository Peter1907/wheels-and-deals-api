require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  before(:each) do
    @car_first = Car.create(name: 'Bettle', photo: 'photo_link', description: 'Nice yellow car', price: 25_000)
    @car_second = Car.create(name: 'Camaro', photo: 'photo_link', description: 'Nice red car', price: 30_000)
  end

  describe 'Cars index path' do
    before { get cars_path }

    it 'returns all cars' do
      expect(response.body).to include(@car_first.name)
      expect(response.body).to include(@car_second.name)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Cars show path' do
    before { get car_path(@car_first.id) }

    it 'returns a specific car' do
      expect(response.body).to include(@car_first.name, @car_first.description)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Cars create path' do
    before(:each) do
      @user = User.create(name: 'Peter', email: 'peter@test.com', password: '123456')
      post login_path, params: { email: @user.email, password: @user.password }
      @token = JSON.parse(response.body)['token']
      @params = {
        name: 'Audi',
        photo: 'photo_link',
        description: 'Nice black car',
        price: 300_000
      }
    end

    it 'returns status code 201 when car is created' do
      post cars_path, headers: { Authorization: @token }, params: @params
      expect(response).to have_http_status(:created)
    end

    it 'returns the errors when the params ara missing' do
      @params[:name] = nil
      @params[:price] = 'abc'
      post cars_path, headers: { Authorization: @token }, params: @params
      expect(response.body).to include('"name":["can\'t be blank"]')
      expect(response.body).to include('"price":["is not a number"]')
    end
  end
end
