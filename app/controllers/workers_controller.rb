class WorkersController < ApplicationController
  def new
    workers
    @worker = @workers.new
  end

  def create
    workers
    @worker = @workers.create(workers_param)
    redirect_to company_path(@company)
  end

  def destroy
    workers
    @worker = @workers.find(params[:id])
    @worker.destroy
    redirect_to company_path(@company)
  end

  def send_to_company
    workers
    @worker = @workers.find(params[:worker_id])
    @worker.update(company_id: params[:new_id])
    @new_company = Company.find(params[:new_id])
    redirect_to company_path(@new_company)
  end

  def another_company_list
    workers
    @worker = @workers.find(params[:worker_id])
    @companies = Company.where.not(id: params[:company_id])
  end

  private

  def workers_param
    params.require(:worker).permit(:name, :description)
  end

  def workers
    @user = current_user
    @company = @user.companies.find(params[:company_id])
    @workers = @company.workers
  end
end
