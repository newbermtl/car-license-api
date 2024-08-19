class CarOwner < ApplicationRecord
  belongs_to :car
  belongs_to :owner
end
