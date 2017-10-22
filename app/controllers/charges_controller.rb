#used to create 1-off charges on individuals posting vans
class ChargesController < ApplicationController

  def new
  end

  def create
    service = StripeApi::ChargeService.new(params)

    if service.perform
      flash[:success] = 'Your van is live!'
    else
      flash[:error] = "There was a problem charging this card - #{service.errors.join()}"
    end

    redirect_to van_path(service.van)
  end

end