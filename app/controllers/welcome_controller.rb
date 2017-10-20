class WelcomeController < ApplicationController

  def show
    @vans = Van.includes(:photos).limit(9)
  end
end
