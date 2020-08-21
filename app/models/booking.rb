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

  def total_price
    diff_days = (self.check_out_date - self.check_in_date).to_i
    (self.car.price_per_day * diff_days) / 10000
  end
end
