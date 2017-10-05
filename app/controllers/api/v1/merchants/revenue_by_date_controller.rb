module Api
  module V1
    module Merchants
      class RevenueByDateController < ApplicationController

        def index
          Merchant.find(params[:id]).merchant_revenue_by_date
        end

      end
    end
  end
end
