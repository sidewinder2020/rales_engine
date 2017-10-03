module Api
  module V1
    class InvoicesController < ApplicationController

      def index
        render json: Invoice.all
      end

      def show
        invoice = Invoice.find(params[:id])
      end

    end
  end
end
