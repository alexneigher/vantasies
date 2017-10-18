class ListingsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :location, :description, :make, :model, :year, :can_deliver)
    end

end