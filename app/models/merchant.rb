class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.random
    order("random()").first
  end

  # def total_revenue(date = nil)
  #   invoices.where(date: date).invoice_total_revenue
  # end

  def self.most_items(limit = 5)
    joins(:items)
    .select("merchants.id, count(merchants.id) as total, merchants.name")
    .group(:id)
    .order("total DESC")
    .limit(limit)
  end

  def self.customers_fav_merchant
    joins(:invoices, :customers)
    .select("merchants.id, merchants.name, count(merchants.id) as total")
    .group(:id)
    .order("total DESC")
    .first
  end

end
