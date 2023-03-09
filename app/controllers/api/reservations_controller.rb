class Api::ReservationsController < Api::ApiController
  def index
    @data = @current_user.reservations.map do |reservation|
      {
        id: reservation.id,
        city: reservation.city,
        country: reservation.country,
        date: reservation.date,
        name: reservation.car.name,
        photo: reservation.car.photo,
        price: reservation.car.price
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

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: @reservation
  end

  private

  def reservation_params
    params.permit(:date, :city, :country, :car_id)
  end
end
