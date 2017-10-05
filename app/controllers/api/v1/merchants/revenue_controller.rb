module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController

        def show
          render json: Merchant.find(params[:id]).total_revenue(revenue_params)
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
end
