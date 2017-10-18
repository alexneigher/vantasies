class VansController < ApplicationController

  before_action :authenticate_user!, only: :new

  def new
    @van = Van.new
  end

  def create
    @van = current_user.vans.new(van_params)

    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
  end

  private
    def van_params
      params.require(:van).permit(:title, :location, :description, :make, :model, :year, :can_deliver)
    end

end