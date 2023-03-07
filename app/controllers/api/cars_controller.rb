class Api::CarsController < Api::ApiController
  skip_before_action :authenticate_request, only: %i[index show]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    @car = [Car.find(params[:id])].map do |car|
      {
        id: car.id,
        name: car.name,
        description: car.description,
        photo: car.photo,
        price: car.price,
        reservationFee: car.reservation_fee
      }
    end
    render json: @car, status: :ok
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    render json: { message: 'Car deleted successfully' }, status: :ok
  end

  private

  def car_params
    params.permit(:name, :photo, :description, :price)
  end
end
