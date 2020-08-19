class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :user, :car, presence: true
  validates :check_in_date, :check_out_date, presence: true

  def self.hostings(user)
    owner_cars = Car.where(user: user)
    hostings = []
    Booking.all.each do |booking|
      hostings << booking if booking.car.user == user
    end
    return hostings
  end

  private
  def total_price
    diff_days = Date.parse(self.check_out_date).mjd - Date.parse(self.check_in_date).mjd
    self.car.price_per_day * diff_days
  end
end
