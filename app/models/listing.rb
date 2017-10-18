class Listing < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :location, :description, :make, :model, :year
end
