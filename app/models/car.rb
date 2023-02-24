class Car < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :photo, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, :reservation_fee, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
