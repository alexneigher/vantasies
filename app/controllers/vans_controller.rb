class VansController < ApplicationController

  def new
    redirect_to new_user_registration_path and return unless user_signed_in?

    redirect_to new_company_van_path(current_user.company) if current_user.has_company?

    @van = Van.new
  end

  def create
    @van = current_user.vans.new(van_params)

    #so we can short circuit payment flow for paid listings
    if params[:coupon_code] == 'nomadsonwheels'
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

    if @van.ready_to_view?(current_user)
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
                :title, :location, :description, :make, :model, :year, :price, :can_deliver, :is_for_sale,
                :latitude, :longitude
                )
    end

end