module Vans
  class PhotosController < ApplicationController

    #gets called by the drag and drop reorder
    def reorder_photos
      @van = Van.find(params[:van_id])

      #split photos into array
      photo_ids = params[:photos].split(',')

      #update each photo with that index as it's position
      photo_ids.each_with_index do |photo_id, i|
        @van.photos.find(photo_id).update(display_order: i)
      end
    end

    def create
      @van = Van.find(params[:van_id])

      if params[:van_photos][:photos].any?
        params[:van_photos][:photos].each do |image|
          @van.photos.create(image: image)
        end
      end
    end
  end

end