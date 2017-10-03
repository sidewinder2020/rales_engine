module Api
  module V1
    module Transactions
      class RandomController < ApplicationController

        def show
          render json: Transaction.random
        end

      end
    end
  end
end
