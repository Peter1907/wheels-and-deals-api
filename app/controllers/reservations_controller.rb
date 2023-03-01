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
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @current_user
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors
    end
  end

  private

  def reservation_params
    params.permit(:date, :city, :country, :car)
  end
end
