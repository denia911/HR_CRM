module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :company_find, only: [:show, :edit, :update, :destroy]

      def index
        @companies = Company.all
        render json: @companies
      end

      def show
        render json: @company
      end

      def edit
        render json: @company
      end

      def create
        @company = Company.create(company_params)
        render json: @company
      end

      def update
        if @company.update(company_params)
          render json: @company
        else
          render 'edit'
        end
      end

      def destroy
        @company.destroy
      end

      private

      def company_find
        @company = Company.find(params[:id])
      end

      def company_params
        params.permit(:name, :description)
      end
    end
  end
end
