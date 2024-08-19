class Car < ApplicationRecord
  has_many :car_owners
  has_many :owners, through: :car_owners
  has_many :modifications

  validates_presence_of(:model, :brand, :year, :license, :legal)
end
