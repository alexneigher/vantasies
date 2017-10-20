class Van < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :photos
  has_many :messages
  has_many :charges
  
  scope :paid, -> { where(is_paid: true) }
  
  validates_presence_of :title, :location, :description, :make, :model, :year, :price

  enum business_type: [:individual, :company]
  enum transmission: [:automatic, :manual]

  enum fuel_type: [:gas, :hybrid, :diesel, :electric]
  enum drivetrain: [:rear_wheel_drive, :front_wheel_drive, :two_wheel_drive, :four_wheel_drive]

  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end
end
