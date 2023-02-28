class User < ApplicationRecord
  require 'securerandom'
  has_secure_password
  has_many :reservations
  has_many :cars, through: :reservations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
