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
        @booking = Booking.new(booking_params)
        @booking.car = Car.find(params[:car_id])
        @booking.user_id = current_user.id
        authorize @booking
        if @booking.save
            redirect_to bookings_path(@booking), notice: "New booking successfully created."
        else
            render 'cars/show'
        end
    end

    def validate
        booking = Booking.find(params[:id])
        authorize booking
        booking.confirmed = params[:status] == "accepted" ? true : false
        booking.save
        redirect_to bookings_path
    end

    private
    def booking_params
        params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_guest, :car_id, :confirmed)
    end
end
