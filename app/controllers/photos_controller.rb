class PhotosController < ApplicationController

  #ued for testing only
  def new
    @photo = Photo.new
  end

  #used to render a photo from a carousel
  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end

  #used for testing only
  def create
    @photo = Photo.new(photo_params.merge(company_id: 2))

    if @photo.save
      redirect_to photo_path(@photo)
    else
      raise @photo.errors.inspect
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:image)
    end
end