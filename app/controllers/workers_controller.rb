class WorkersController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @worker = @company.workers.new
  end

  def create
    @company = Company.find(params[:company_id])
    @worker = @company.workers.create(workers_param)
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @worker = @company.workers.find(params[:id])
    @worker.destroy
    redirect_to company_path(@company)
  end

  def send_to_company
    @company = Company.find(params[:company_id])
    @worker = @company.workers.find(params[:worker_id])
    @worker.update(company_id: params[:new_id])
    @new_company = Company.find(params[:new_id])
    redirect_to company_path(@new_company)
  end

  def another_company_list
    @company = Company.find(params[:company_id])
    @worker = @company.workers.find(params[:worker_id])
    @companies = Company.where.not(id: params[:company_id])
  end

  private
  def workers_param
    params.require(:worker).permit(:name, :description)
  end
end
