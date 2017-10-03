module Api
  module V1
    module Customers
      class RandomController < ApplicationController

        def show
          render json: Customer.random
        end

      end
    end
  end
end
