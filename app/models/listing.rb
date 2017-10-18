class Listing < ApplicationRecord

  validates_presence_of :title, :location, :description, :make, :model, :year
end
