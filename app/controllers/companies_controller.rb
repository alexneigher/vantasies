class CompaniesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @company = Company.new
  end

  def create
    @company = current_user.build_company(company_params)

    if @company.save
      redirect_to company_path(@company)
    else
      raise 'nop'
    end
  end

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end

end