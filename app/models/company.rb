class Company < ApplicationRecord
  belongs_to :user

  has_many :vans
  has_many :photos

  validates_uniqueness_of :user_id

  def card_photo
    return "https://source.unsplash.com/random" unless photos.any?
    photos.ordered.first.image.url(:medium)
  end

  def ready_to_view?(current_user)
    return true if user_id == current_user.try(:id) #this person is the author
    return true if is_paid?
  end
end
