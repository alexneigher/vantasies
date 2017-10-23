module Vans
  class InspirationController < ApplicationController

    def index
      @vans = Van.order(created_at: :desc).not_for_sale.includes(:photos)
    end
  end
end
