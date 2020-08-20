# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Booking.destroy_all
Car.destroy_all
User.destroy_all

users = []

steffen = User.create(email: 'steffen@ecars.com', password: '123456')
aron = User.create(email: 'aron@ecars.com', password: '123456')
nino = User.create(email: 'nino@ecars.com', password: '123456')
fiona = User.create(email: 'fiona@ecars.com', password: '123456')

[steffen, aron, nino, fiona].each { |member| users << member }

locations = ["Unter den Linden 7, 10117 Berlin", "Spreeweg 1, 10557 Berlin", "Panoramastraße 1A, 10178 Berlin", "Pariser Platz 3, 10117 Berlin", "Platz der Republik 1, 11011 Berlin", "Platz der Luftbrücke 5, 12101 Berlin", "Am Lustgarten, 10178 Berlin", "Bodestraße 1-3, 10178 Berlin", "Bernauer Straße 111, 13355 Berlin", "Unter den Linden 2, 10117 Berlin", "Friedrichstraße 43-45, 10969 Berlin", "Spandauer Damm 10, 14059 Berlin", "Lindenstraße 9-14, 10969 Berlin", "Trebbiner Straße 9, 10963 Berlin", "Cora-Berliner-Straße 1, 10117 Berlin", "Turmstr. 18, 10559 Berlin", "Niederkirchnerstraße 8, 10963 Berlin", "Hardenbergplatz 8, 10787 Berlin", "Königin-Luise-Strasse 6-8, 14195 Berlin", "Karl-Liebknecht-Str. 1, 10178 Berlin"]

cars = [
  {
    photo: "https://images.unsplash.com/flagged/photo-1579840947450-eb22b16fa71b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80", brand: "BMW", model: "i8", description: "Sports car built to thrill", price_per_day: 60, number_of_seat: 2, category: "sports car"
  },
  {
    photo: "https://efahrer-images.chip.de/_cgep8FUl-bcRKreHUj941yWm44=/640x400/center/middle/efahrer.chip.de/files/egolf.jpg", brand: "VW", model: "eGolf", description: "Beloved classic, now as an electric", price_per_day: 20, number_of_seat: 4, category: "compact city"
  },
  {
    photo: "https://www.autozeitung.de/assets/field/image/vw-id3-2019-03_0.jpg", brand: "VW", model: "iD", description: "Introducing the city car of the future", price_per_day: 30, number_of_seat: 4, category: "compact city"
  },
  {
    photo: "https://teslamag.de/wp-content/uploads/2019/06/Tesla-Model-3-Performance-Test-1200x689.jpg", brand: "Tesla", model: "3", description: "The city car from the USA", price_per_day: 25, number_of_seat: 4, category: "compact city"
  },
  {
    photo: "https://images.unsplash.com/photo-1536700503339-1e4b06520771?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", brand: "Tesla", model: "S", description: "The all-round electric champion", price_per_day: 60, number_of_seat: 4, category: "all-rounder"
  },
    {
    photo: "https://electriccarhome.co.uk/wp-content/uploads/2020/03/tesla-model-x.jpg", brand: "Tesla", model: "X", description: "The sporty family car, with doors that will make your jaw drop", price_per_day: 65, number_of_seat: 4, category: "family car"
  },
  {
    photo: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-mercedes-benz-eqc-4-1547234221.jpg", brand: "Mercedes Benz", model: "EQC", description: "The futuristic family car", price_per_day: 70, number_of_seat: 4, category: "family car"
  },
  {
    photo: "https://i2.wp.com/motorsactu.com/wp-content/uploads/2019/09/Toyota-Prius-2019-1024-07.jpg?fit=1024%2C768&ssl=1", brand: "Toyota", model: "Prius", description: "The original environmental hero", price_per_day: 25, number_of_seat: 4, category: "all-rounder"
  },
  {
    photo: "https://cdn.motor1.com/images/mgl/KkQwq/s1/hyundai-kona-hybrid.jpg", brand: "Hyundai", model: "Kona", description: "The all-round family car to fulfill all needs", price_per_day: 40, number_of_seat: 4, category: "family car"
  },
  {
    photo: "https://www.hyundai.news/fileadmin/eu/_processed_/0/7/csm_hyundai-new-ioniq-electric-04-1610_751619ef02.jpg?download=true", brand: "Hyundai", model: "Ioniq", description: "The nifty little city speedster", price_per_day: 15, number_of_seat: 4, category: "compact city"
  },
  {
    photo: "https://evcompare.io/upload/resize_cache/iblock/b9a/768_512_2/b9a2b3978d675310c5d6eb16cd10bf2d.jpg", brand: "BYD", model: "e1", description: "Find parking even in the tightest of spaces", price_per_day: 15, number_of_seat: 4, category: "compact city"
  },
  {
    photo: "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/byd-e6-rt-8_0.jpg?itok=3fr4xfKg", brand: "BYD", model: "e6", description: "The standard from China, available now in Europe!", price_per_day: 20, number_of_seat: 4, category: "family car"
  },
]

cars.each do |car|
  location = locations.sample
  locations.delete(location)
  c = Car.new(
    brand: car[:brand],
    model: car[:model],
    description: car[:description],
    location: location,
    price_per_day: car[:price_per_day],
    number_of_seat: car[:number_of_seat],
    category: car[:category],
    user: users.sample)
  c.photo.attach(io:URI.open(car[:photo]), filename: "file.jpg")
  c.save
end

puts 'Seeds finished!'
















