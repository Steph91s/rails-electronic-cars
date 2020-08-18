class CarsController < ApplicationController
    before_action :set_car, only: [ :show ]
    
    def index
        @cars = policy_scope(Car).order(created_at: :desc)
    end

    def show
        @booking = Booking.new
    end

    def new
        @car = Car.new
        authorize @car
    end

    def create
        @car = Car.new(car_params)
        @car.user = current_user
        authorize @car
        if @car.save
            redirect_to car_path(@car), notice: "new car created"
        else
            render 'new'
        end
    end

    private
    def car_params
        params.require(:car).permit(:brand, :model, :price_per_day, :description, :category, :user_id, :location) #:photo for Cloudinary.  :longitude, :latitude => for Geocode
    end

    def set_car
        @car = Car.find(params[:id])
        authorize @car
    end
end
