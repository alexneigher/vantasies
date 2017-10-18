class WelcomeController < ApplicationController

  def show
    @vans = Van.includes(:photos).paid.limit(3)
  end
end
