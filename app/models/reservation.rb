class Reservation < ApplicationRecord
  belongs_to :users
  belongs_to :cars

  validates :date, :city, :country, presence: true
end
