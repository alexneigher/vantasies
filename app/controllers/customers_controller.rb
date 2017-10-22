#this is used when a company signs up for a subscription
class CustomersController < ApplicationController

  def create
    service = StripeApi::CustomerService.new(params)

    if service.perform
      flash[:success] = 'Your company is live!'
    else
      flash[:error] = "There was a problem with that Card: #{service.errors.join('')}"
    end

    redirect_to company_path(service.company)
  end
end