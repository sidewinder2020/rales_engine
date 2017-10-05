module Api
  module V1
    module Merchants
      class RevenueByDateController < ApplicationController

        def index
        total_revenue = Merchant.merchant_revenue_by_date(params[:date])
        render json: total_revenue, serializer: MerchantRevenueSerializer
        end
      end
    end
  end
end
