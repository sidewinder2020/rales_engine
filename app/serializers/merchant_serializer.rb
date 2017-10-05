class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :merchant_revenue

  def merchant_revenue
    object.merchant_revenue_by_date(date)
  end
end
