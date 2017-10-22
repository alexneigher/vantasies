module Vans
  class InspiredController < ApplicationController
    
    def index
      @vans = Van.not_for_sale.includes(:photos)
    end
  end
end