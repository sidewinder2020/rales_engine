module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApplicationController

        def index
          render json: Merhant.find(params[:id]).favorite_customer
        end

      end
    end
  end
end
