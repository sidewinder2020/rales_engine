module Api
  module V1
    module merchants
      class SearchController < ApplicationController

        def index
          render json: Merchant.all
        end

      end
    end
  end
end
