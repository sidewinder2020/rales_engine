module Api
  module V1
    module Merchants
      class MostRevenueQuantityController < ApplicationController

        def index
          render json: Merchant.most_revenue(quantity_params[:quantity])
        end

        private

        def quantity_params
          params.permit(:quantity)
        end

      end
    end
  end
end
