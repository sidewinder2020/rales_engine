class MerchantRevenueSerializer < ActiveModel::Serializer
    attributes :revenue

    def revenue
      final_revenue = object / 100.to_f
      final_revenue.to_s
    end
  end
