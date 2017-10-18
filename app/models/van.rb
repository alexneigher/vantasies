class Van < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates_presence_of :title, :location, :description, :make, :model, :year, :price
end
