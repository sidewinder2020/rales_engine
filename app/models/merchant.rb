class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.random
    order("random()").first
  end

  def total_revenue(date = nil)
    invoices.where(date: date).invoice_total_revenue
  end

  def most_items(limit = 5)
    joins(:items)
    .select("merchants.id, count(merchants.id) as total")
    .group(:id)
    .order("total DESC")
    .limit(limit)
  end

end
