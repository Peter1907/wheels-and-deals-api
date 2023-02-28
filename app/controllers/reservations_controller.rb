class ReservationsController < ApplicationController
  def index
    @data = @current_user.reservations.map do |reservation|
      {
        city: reservation.city,
        date: reservation.date,
        car_name: reservation.car.name
      }
    end
    render json: @data
  end

  def create
    @reservation = Reservation.create(
      date: params[:date],
      city: params[:city],
      country: params[:country],
      user: @current_user,
      car: current_car
    )
    render json: @reservation
  end

  private

  def current_user
    User.first
  end

  def current_car
    Car.first
  end
end
