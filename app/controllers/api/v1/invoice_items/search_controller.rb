module Api
  module V1
    module InvoiceItems
      class SearchController < ApplicationController

        def index
          render json: InvoiceItem.where(search_params)
        end

        def show
          render json: InvoiceItem.find_by(search_params)
        end

        private

        def search_params
          if params[:unit_price]
            params[:unit_price] = params[:unit_price].delete('.')
          end
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end

      end
    end
  end
end
