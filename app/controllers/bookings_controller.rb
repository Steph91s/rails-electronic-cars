class BookingsController < ApplicationController
    def create
        @car = Car.find(params[:car_id])
        @booking = Booking.new(booking_params)
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
