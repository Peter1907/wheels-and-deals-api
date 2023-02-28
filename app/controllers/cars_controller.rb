class CarsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors
    end
  end

  private

  def car_params
    params.permit(:name, :photo, :description, :price)
  end
end
