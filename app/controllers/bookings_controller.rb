class BookingsController < ApplicationController
    def index
        @bookings = policy_scope(Booking).order(created_at: :desc)
    end
    
    def new
        @booking = Booking.new
        authorize @booking
    end

    def show
        @booking = Booking.find(params[:id])
        @car = Car.new
    end
    def create
        @car = Car.find(params[:car_id])
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        authorize @booking
        if @booking.save
            redirect_to car_path(@car), notice: "New booking successfully created."
        else
            render 'cars/show'
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_guest, :confirmed, :user_id)
    end
end
