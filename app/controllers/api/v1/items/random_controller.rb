module Api
  module V1
    module Items
      class RandomController < ApplicationController

        def show
          render json: Item.random
        end

      end
    end
  end
end
