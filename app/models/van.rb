class Van < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :photos
  has_many :messages
  has_many :charges

  scope :paid, -> { where(is_paid: true) }
  scope :for_sale, -> { where(is_for_sale: true) }
  scope :not_for_sale, -> { where(is_for_sale: false) }

  validates_presence_of :title, :description, :make, :model, :year, :price

  enum transmission: [:automatic, :manual]

  enum fuel_type: [:gas, :hybrid, :diesel, :electric]
  enum drivetrain: [:rear_wheel_drive, :front_wheel_drive, :two_wheel_drive, :four_wheel_drive]
  enum condition: [:brand_new, :like_new, :used, :heavily_used, :rust_bucket]

  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end

  def needs_to_pay?
    is_for_sale? && !is_paid?
  end

  def owned_by_company?
    company_id.present?
  end

  def ready_to_view?(current_user)
    return true if user_id == current_user.try(:id) #this person is the author
    return true if is_paid?

    return true if !is_for_sale?
    
    false
  end
end
