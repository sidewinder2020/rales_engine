module Api
  module V1
    module Items
      class MerchantController < ApplicationController

        def show
          render json: Item.find(params[:id]).merchant
        end

      end
    end
  end
end
