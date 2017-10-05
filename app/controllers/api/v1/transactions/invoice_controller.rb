module Api
  module V1
    module Transactions
      class InvoiceController < ApplicationController

        def show
          render json: Transaction.find(params[:id]).invoice
        end

      end
    end
  end
end
