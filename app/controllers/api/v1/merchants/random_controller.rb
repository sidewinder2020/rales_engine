require 'pry'

module Api
  module V1
    module Merchants
      class RandomController < ApplicationController

        def show
          render json: Merchant.random
        end

      end
    end
  end
end
