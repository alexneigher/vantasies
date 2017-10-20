class Company < ApplicationRecord
  belongs_to :user

  has_many :vans
  has_many :photos
end
