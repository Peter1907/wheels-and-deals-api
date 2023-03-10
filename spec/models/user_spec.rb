require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  before :each do
    @user_first = User.create(
      name: 'Microverse',
      email: 'test@gmail.com',
      password: '123456'
    )

    @user_second = User.create(
      name: 'Student',
      email: 'test2@gmail.com',
      password: '123456'
    )
  end

  context 'Test user validations' do
    it 'is valid with valid attributes' do
      expect(@user_first).to be_valid
      expect(@user_second).to be_valid
    end

    it 'name must not be blank' do
      @user_first.name = nil
      expect(@user_first).to_not be_valid
    end

    it 'email must be uniqued' do
      @user_second.email = 'test@gmail.com'
      expect(@user_second).to_not be_valid
    end
  end
end
