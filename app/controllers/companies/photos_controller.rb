module Companies
  class PhotosController < ApplicationController

    #gets called by the drag and drop reorder
    def reorder_photos
      @company = Company.find(params[:company_id])

      #split photos into array
      photo_ids = params[:photos].split(',')

      #update each photo with that index as it's position
      photo_ids.each_with_index do |photo_id, i|
        @company.photos.find(photo_id).update(display_order: i)
      end
    end

    def create
      @company = Company.find(params[:company_id])

      if params[:company_photos][:photos].any?
        params[:company_photos][:photos].each do |image|
          @company.photos.create(image: image)
        end
      end
    end
  end

end