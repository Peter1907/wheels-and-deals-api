class Api::ReservationsController < ApplicationController
  def index
    @data = User.find(current_user.id).reservations.map do |reservation|
      {
        city: reservation.city,
        date: reservation.date,
        car_name: reservation.car.name
      }
    end
    
    render json: @data
  end

  def create

  end


  private

  def current_user
    User.first
  end
end