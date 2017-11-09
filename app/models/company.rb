class Company < ApplicationRecord
  belongs_to :user

  has_many :vans
  has_many :photos

  validates_uniqueness_of :user_id

  before_save :website_url_is_absolute

  def original_photo
    return '' unless photos.any?
    photos.ordered.first.image.url(:original)
  end

  def ready_to_view?(current_user)
    return true if user_id == current_user.try(:id) #this person is the author
    return true if is_paid?
  end

  private
    def website_url_is_absolute
      absolute_url = self.website_url.gsub('https://','').gsub('http://','').prepend('http://')
      self.website_url = absolute_url
    end
end
