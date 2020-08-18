class Car < ApplicationRecord
  BRAND = ["BMW", "VW", "Tesla", "Mercedes Benz", "Toyota", "Hyundai", "BYD"]
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :brand, presence: true, inclusion: { in: BRAND }
  validates :model, :brand, :location, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
  validates :number_of_seat, presence: true, inclusion: { in: [1, 2, 3, 4] }
  #geocoded_by :location
end
