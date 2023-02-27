require 'rails_helper'

RSpec.describe Car, type: :model do
  # tests go here
  before :each do
    @car_first = Car.create(
      name: 'Bettle',
      photo: 'photo_link',
      description: 'Nice yellow car',
      price: 25_000
    )
  end

  context 'Test car validations' do
    it 'is valid with valid attributes' do
      expect(@car_first).to be_valid
    end

    it 'name must not be blank' do
      @car_first.name = nil
      expect(@car_first).to_not be_valid
    end

    it 'description must not be blank' do
      @car_first.description = nil
      expect(@car_first).to_not be_valid
    end
  end

  context 'Test car.price validations' do
    it 'price must not be blank' do
      @car_first.price = nil
      expect(@car_first).to_not be_valid
    end

    it 'price must be an integer' do
      @car_first.price = 'foo'
      expect(@car_first).to_not be_valid
    end

    it 'price must be grater than zero' do
      @car_first.price = -234
      expect(@car_first).to_not be_valid
    end
  end
end
