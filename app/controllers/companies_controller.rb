class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    redirect_to @company
  end

  private
  def company_params
    params.require(:company).permit(:name, :description)
  end
end
