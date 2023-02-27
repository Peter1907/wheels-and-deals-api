class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :date, :city, :country, presence: true
end
