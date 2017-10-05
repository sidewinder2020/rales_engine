module Api
  module V1
    module Merchants
      class RevenueByDateController < ApplicationController

        def index
<<<<<<< HEAD
        total_revenue = Merchant.merchant_revenue_by_date(params[:date])
        render json: total_revenue, serializer: MerchantRevenueSerializer
=======
        render json:  Merchant..merchant_revenue_by_date(revenue_params)
>>>>>>> eb93097e0a3eedf6f07f7afd0a86cacc74539fe1
        end
      end
    end
  end
end
