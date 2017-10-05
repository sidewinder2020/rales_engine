module Api
  module V1
    module Merchants
      class RevenueByDateController < ApplicationController

        def index
          binding.pry
        render json:  Merchant..merchant_revenue_by_date(revenue_params)
        end

        private

        def revenue_params
            params[:date]
            params[:created_at] = params[:date]
            params.permit(:created_at)
        end

      end
    end
  end
end
