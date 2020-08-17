class CarsController < ApplicationController
    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
        @booking = Booking.new
    end

    def new
        @car = Car.new
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            redirect_to car_path(@car), notice: "new car created"
        else
            render 'new'
        end
    end

    private
    def car_params
        params.require(:car).permit(:brand, :model, :price_per_day, :description, :category, :user_id, :location, :longitude, :latitude)
    end

end
