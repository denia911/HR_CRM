class CompaniesController < ApplicationController
  def index
    @user = current_user
    @companies = @user.companies.all
  end

  def show
    @user = current_user
    @company = @user.companies.find(params[:id])
  end

  def new
    @user = current_user
    @company = @user.companies.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @user = current_user
    @company = @user.companies.new(company_params)
    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :description)
  end
end
