module API
  module V1
    class InvoicesController < ApplicationController

      def index
        render json: Invoice.all
      end

      def create
        render json:Invoice.create(item_params)
      end

      def show
        invoice = Invoice.find(params[:id])
      end

    end
  end

  private
    def item_params
      params.requre(:invoice).permit(:customer_id, :merchant_id, :status)
    end
end
