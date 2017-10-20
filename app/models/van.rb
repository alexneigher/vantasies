class Van < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :photos
  has_many :messages
  has_many :charges
  
  scope :paid, -> { where(is_paid: true) }
  
  validates_presence_of :title, :description, :make, :model, :year, :price

  enum transmission: [:automatic, :manual]

  enum fuel_type: [:gas, :hybrid, :diesel, :electric]
  enum drivetrain: [:rear_wheel_drive, :front_wheel_drive, :two_wheel_drive, :four_wheel_drive]

  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end

  def needs_to_pay?
    is_for_sale? && !is_paid?
  end
end
