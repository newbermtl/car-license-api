# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
p "Clearing db"
CarOwner.destroy_all
Owner.destroy_all
Car.destroy_all
p "db cleared"

p "Filling db"
5.times do
  # Create owners
  owner = Owner.create!(name: Faker::Name.name, age: rand(16...99))

  # Create test cars
  car_brand = Faker::Vehicle.make
  car = Car.create!(model: Faker::Vehicle.model(make_of_model: car_brand), brand: car_brand, year: Faker::Vehicle.year, license: Faker::Vehicle.license_plate, legal: true)

  CarOwner.create!(car: car, owner: owner)
end

Modification.create!(name: "lifted", car: Car.last)
p "db filled"
