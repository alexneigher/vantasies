module Companies
  class VansController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    before_action :only_allow_companies, only: [:new, :create, :edit, :update]

    def new
      @van = @company.vans.new
    end

    def create
      @van = Van.new(van_params.merge(company_id: params[:company_id], user_id: current_user.id))

      if @company.van_credits > 0
        @van.is_paid = true
        @company.van_credits = @company.van_credits - 1
      end

      if @van.save && @company.save
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


    private
      def only_allow_companies
        @company = current_user.company

        return false unless @company.present?
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
end