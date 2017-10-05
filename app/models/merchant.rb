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
    .merge(Transaction.successful)
    .group(:id)
    .order("customer_transactions DESC")
    .first
  end

  def self.most_revenue(limit_quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as merch_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("merch_revenue desc")
    .limit(limit_quantity)
  end

  def merchant_revenue_by_date(date)
    invoices
    .joins(:invoice_items, :transactions)
    .where(invoices: {created_at: date})
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def customers_with_pending_invoices
    customers
    .joins(:transactions)
    .merge(Transaction.failed)
  end

  def revenue(filter = nil)
    Invoice
    .where(filter)
  end

end
