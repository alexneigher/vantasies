class Company < ApplicationRecord
  belongs_to :user

  has_many :vans
  has_many :photos

  validates_uniqueness_of :user_id

  def card_photo
    return "https://images.unsplash.com/photo-1491314768749-82db5ebd6499?w=400" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end

  def original_photo
    return '' unless photos.any?
    photos.ordered.first.image.url(:original)
  end

  def ready_to_view?(current_user)
    return true if user_id == current_user.try(:id) #this person is the author
    return true if is_paid?
  end
end
