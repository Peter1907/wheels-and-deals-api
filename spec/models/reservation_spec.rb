require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # tests go here
  before :each do
    @car_first = Car.create(
      name: 'Bettle',
      photo: 'photo_link',
      description: 'Nice yellow car',
      price: 25_000
    )
    @user_first = User.create(
      name: 'Microverse',
      email: 'test@gmail.com',
      password: '123456'
    )
    @reservation = Reservation.create(
      date: '2024-10-10',
      city: 'Mexico City',
      country: 'Mexico',
      user_id: @user_first.id,
      car_id: @car_first.id
    )
  end

  context 'Test reservation validations' do
    it 'is valid with valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'date must not be blank' do
      @reservation.date = nil
      expect(@reservation).to_not be_valid
    end

    it 'city must not be blank' do
      @reservation.city = nil
      expect(@reservation).to_not be_valid
    end

    it 'country must not be blank' do
      @reservation.country = nil
      expect(@reservation).to_not be_valid
    end
  end
end
