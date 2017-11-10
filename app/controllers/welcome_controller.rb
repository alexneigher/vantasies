class WelcomeController < ApplicationController

  def show
    @vans = Van.order(created_at: :desc).includes(:photos).limit(9)
    @companies = Company.includes(:photos).limit(6)
  end
end
