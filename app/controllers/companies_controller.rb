class CompaniesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    redirect_to root_path if current_user.has_company?
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

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def index
    @companies = Company.includes(:photos).all
  end

  def show
    @company = Company.includes(:photos, vans: :photos).find(params[:id])
    redirect_to companies_path unless @company.ready_to_view?(current_user)
  end

  private
    def company_params
      params
        .require(:company)
          .permit(:name,
                  :location,
                  :description,
                  :website_url,
                  :phone_number,
                  :services_offered,
                  :latitude,
                  :longitude
                )
    end

end
