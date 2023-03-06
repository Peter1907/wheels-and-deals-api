class Api::ReservationsController < Api::ApiController
  def index
    @data = @current_user.reservations.map do |reservation|
      {
        country: reservation.country,
        city: reservation.city,
        date: reservation.date,
        car_name: reservation.car.name
      }
    end
    render json: { error: 'No reservations found' }, status: :not_found if @data.empty?
    render json: @data, status: :ok unless @data.empty?
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
    params.permit(:date, :city, :country, :car_id)
  end
end
