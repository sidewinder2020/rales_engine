module Api
  module V1
    module InvoiceItems
      class RandomController < ApplicationController

        def show
          render json: InvoiceItem.random
        end

      end
    end
  end
end
