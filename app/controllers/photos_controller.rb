class PhotosController < ApplicationController


  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params.merge(van_id: 1))

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