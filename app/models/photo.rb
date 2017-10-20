class Photo < ApplicationRecord
  belongs_to :van, optional: true
  belongs_to :company, optional: true

  has_attached_file :image, styles: {
    medium: '500x300>', #used on cards
    large:  '700x700>', #used in carousel
    full_size: '2000x2000' #used to render full photo in modal
  }

  scope :ordered, -> { order(:display_order) }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
