class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices

  def self.random
    order("random()").first
  end

  def favorite_customer
    customers
    .select("customers.*, count(transactions) as customer_transactions")
    .joins(:transactions)
    .merge(transactions.successful)
    .group(:id)
    .order("customer_transactions DESC")
    .first
  end

  def self.most_revenue(limit_quantity)
    .select("merchants.*, sum(invoice_items.quantity * invoive_items.unit_price) as merch_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .order("merch_revenue desc")
    .limit(limit_quantity)
  end

end
