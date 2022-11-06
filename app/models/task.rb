class Task < ApplicationRecord

  validates :name, :assigned, :room, :presence => true
  # validates :allowance, numericality: { greater_than_or_equal_to: 0 }

  PEOPLE = ["Dad", "Mom", "Lauren", "Melanie", "Victoria", "Seth"]
  validates :assigned, inclusion: { in: PEOPLE }

  ROOMS = ["Kitchen", "Hallway", "Living Room", "Dining Room", "Kid's Bathroom", "Master Bathroom", "Master Bedroom", "Seth's Bedroom", "Girl's Bedroom", "Balcony"]
  validates :room, inclusion: { in: ROOMS }
end
