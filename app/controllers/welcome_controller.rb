class WelcomeController < ApplicationController

  def show
    @vans = Van.order(:created_at).includes(:photos).limit(9)
  end
end
