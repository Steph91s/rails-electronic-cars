class CarsController < ApplicationController
    before_action :set_car, only: [ :show ]

    def index
        @cars = policy_scope(Car)
        if params[:query].present?
            sql_query = " \
            cars.brand @@ :query \
            OR cars.model @@ :query \
            "
            @cars = @cars.order(created_at: :desc).where(sql_query, query: "%#{params[:query]}%")# returns flats with coordinates
        end

        if params[:location].present?
            @cars = @cars.near(params[:location], 10)
        end

        @markers = @cars.geocoded.map do |car|
        {
            lat: car.latitude,
            lng: car.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { car: car })
            #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
        end
    end

    def show
        @car = Car.find(params[:id])
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
        params.require(:car).permit(:brand, :model, :photo, :price_per_day, :description, :category, :user_id, :location, :number_of_seat) #:photo for Cloudinary.  :longitude, :latitude => for Geocode
    end

    def set_car
        @car = Car.find(params[:id])
        authorize @car
    end
end
