module API
  module V1
    module Invoices
      class SearchController < ApplicationController

        def index
          Invoice.where(search_params)
        end

        def show
          Invoice.find_by(search_params)
        end

      end
    end
  end

  private
    def search_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
