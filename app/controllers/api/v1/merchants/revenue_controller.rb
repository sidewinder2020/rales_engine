module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController

        def show
          render json: Merchant.find(params[:id]).total_revenue(revenue_params)
        end

        private

        def revenue_params
          params.permit(:created_at)
        end

      end
    end
  end
end
