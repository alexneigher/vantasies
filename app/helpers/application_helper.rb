module ApplicationHelper

  def card_photo(photos)
    return "https://images.unsplash.com/photo-1491314768749-82db5ebd6499?w=400" unless photos.any?
    photos.sort_by(&:display_order).first.image.url(:medium)
  end
end
