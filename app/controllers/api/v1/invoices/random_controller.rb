module Api
  module V1
    module Invoices
      class RandomController < ApplicationController

        def show
          render json: Invoice.random
        end

      end
    end
  end
end
