class CompaniesController < ApplicationController
  def index
    @companies = companies.all
  end

  def show
    @company = companies.find(params[:id])
  end

  def new
    @company = companies.new
  end

  def edit
    @company = companies.find(params[:id])
  end

  def create
    @company = companies.new(company_params)
    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def update
    @company = companies.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = companies.find(params[:id])
    @company.destroy

    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :description)
  end

  def companies
    @companies = current_user.companies
  end
end
