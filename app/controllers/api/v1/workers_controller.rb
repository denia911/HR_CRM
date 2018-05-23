module Api
  module V1
    class WorkersController < ApplicationController
      before_action :worker, only: [:show, :update, :destroy]
      before_action :workers, only: [:create, :all]

      def show
        render json: @worker
      end

      def create
        @worker = @workers.create(workers_param)
        render json: @worker
      end

      def update
        @worker.update(workers_param)
        render json: @worker
      end

      def destroy
        @worker.destroy
      end

      def send_to_company
        @worker = Worker.find(params[:worker_id])
        @worker.update(company_id: params[:new_id])
        @new_company = Company.find(params[:new_id])
        render json: @new_company
      end

      def another_company_list
        @worker = Worker.find(params[:worker_id])
        @companies = Company.where.not(id: @worker.company_id)
        render json: @companies
      end

      def all
        @company_workers = @workers.all
        render json: @company_workers
      end

      private

      def workers_param
        params.permit(:name, :description)
      end

      def workers
        @company = Company.find(params[:company_id])
        @workers = @company.workers
      end

      def worker
        @worker = Worker.find(params[:id])
      end
    end
  end
end
