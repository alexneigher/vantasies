module Vans
  class ForSaleController < ApplicationController
    
    def index
      @vans = Van.paid.for_sale.includes(:photos)
    end
  end
end