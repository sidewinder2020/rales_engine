module Api
  module V1
    module Invoices
      class MerchantController < ApplicationController

        def show
          render json: Invoice.find(params[:id]).merchant
        end

      end
    end
  end
end
