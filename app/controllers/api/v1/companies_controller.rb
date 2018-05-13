module Api
  module V1
    class CompaniesController < ApplicationController
      def index
        @companies = Company.all
        render json: @companies
      end

      def show
        @company = Company.find(params[:id])
        render json: @company
      end

      def edit
        @company = Company.find(params[:id])
        render json: @company
      end

      def create
        @company = Company.create(company_params)
        render json: @company
      end

      def update
        @company = Company.find(params[:id])

        if @company.update(company_params)
          render json: @company
        else
          render 'edit'
        end
      end

      def destroy
        @company = Company.find(params[:id])
        @company.destroy
      end

      private

      def company_params
        params.permit(:name, :description)
      end
    end
  end
end
