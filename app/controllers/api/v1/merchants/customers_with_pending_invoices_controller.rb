module Api
  module V1
    module Merchants
      class CustomersWithPendingInvoicesController < ApplicationController

        def show
          render json: Merchant.find(params[:id]).customers_with_pending_invoices
        end

      end
    end
  end
end
