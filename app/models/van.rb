class Van < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  scope :paid, -> { where(is_paid: true) }
  
  validates_presence_of :title, :location, :description, :make, :model, :year, :price



  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.first.image.url(:medium)
  end
end
