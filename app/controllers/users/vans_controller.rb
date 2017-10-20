module Users
  class VansController < ApplicationController
    before_action :authenticate_van_owner, only: [:edit, :update]

    def index
      @user = User.find(params[:user_id])
      @vans = @user.vans.includes(:photos)
    end

    def edit
    end

    def update
      if @van.update(van_params)
        redirect_to van_path(@van)
      else
        flash[:error] = 'Whoops'
        redirect_to edit_user_van_path(current_user, @van)
      end
    end


    private
      def authenticate_van_owner
        @van = Van.includes(:photos).find(params[:id])
        redirect_to root_path and return unless current_user == @van.user
      end

      private
        def van_params
          params
            .require(:van)
            .permit(
                    :condition, :mileage, :transmission, :vin, :fuel_type, :drivetrain, :features, :instagram_url,
                    :title, :location, :description, :make, :model, :year, :price, :can_deliver
                    )
        end
  end
end