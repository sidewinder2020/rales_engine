class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    final_revenue = object / 100.to_f
    final_revenue.to_s
  end
end
