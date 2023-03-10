class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, :photo, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def reservation_fee
    fee = price * 0.002
    return 300 if fee < 300

    fee
  end
end
