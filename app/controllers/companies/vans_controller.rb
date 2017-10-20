module Companies
  class VansController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    before_action :only_allow_companies, only: [:new, :create, :edit, :update]

    def new
      if @company.van_credits.zero?
        render :buy_credits and return
      else
        @van = @company.vans.new
      end
    end

    def create
      
    end


    private
      def only_allow_companies
        @company = current_user.company

        return false unless @company.present?
      end
  end
end