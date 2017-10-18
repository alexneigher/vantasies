class WelcomeController < ApplicationController

  def show
    @vans = Van.all.limit(3)
  end
end
