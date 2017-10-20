class VansController < ApplicationController

  before_action :authenticate_user!, only: :new

  def new
    @van = Van.new
  end

  def create
    @van = current_user.vans.new(van_params)

    #so we can short circuit payment flow for paid listings
    if params[:coupon_code] = 'nomadsonwheels'
      @van.is_paid = true
    end

    if @van.save
      if params[:photos]
        params[:photos].each { |image|
          @van.photos.create(image: image)
        }

      end
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def index
    @vans = Van.includes(:photos).all
  end

  def show
    @van = Van.includes(:photos).find(params[:id])

    if @van.is_paid? || @van.user_id == current_user.try(:id) #maybe not logged in
      render :show
    else
      flash[:warning] = "We can't find that van"
      redirect_to root_path
    end

  end

  private
    def van_params
      params
        .require(:van)
        .permit(
                :condition, :mileage, :transmission, :vin, :fuel_type, :drivetrain, :features, :instagram_url,
                :title, :location, :description, :make, :model, :year, :price, :can_deliver, :is_for_sale
                )
    end

end