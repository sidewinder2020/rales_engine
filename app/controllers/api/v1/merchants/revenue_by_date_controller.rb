module Api
  module V1
    module Merchants
      class RevenueByDateController < ApplicationController

        def index
          binding.pry
        render json:  Merchant.find(params[:id]).merchant_revenue_by_date(revenue_params)
        end

        private

        def revenue_params
          if params[:date]
            params[:created_at] = params[:date]
            params.permit(:merchant_id, :created_at)
          else
            params.permit(:merchant_id)
        end

      end
    end
  end
end
