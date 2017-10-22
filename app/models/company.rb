class Company < ApplicationRecord
  belongs_to :user

  has_many :vans
  has_many :photos

  validates_uniqueness_of :user_id

  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end
end
