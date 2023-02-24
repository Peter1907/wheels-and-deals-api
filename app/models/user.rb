class User < ApplicationRecord
  has_many :reservations
  has_many :cars, through: :reservations

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
end
