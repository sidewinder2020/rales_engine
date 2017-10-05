
class Merchant < ApplicationRecord

include ActiveModel::Serialization

  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

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

  def self.merchant_revenue_by_date(date)
    Invoice.joins(:invoice_items, :transactions)
    .where(invoices: {created_at: date})
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def customers_with_pending_invoices
    customers
    .joins(:transactions)
    .merge(Transaction.failed)
  end


  def total_revenue(filter = nil)
    invoices
    .where(filter)
    .invoice_total_revenue
  end

  def self.most_items(limit = 5)
    joins(:items)
    .select("merchants.*, count(merchants.id) as total")
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

  def customers_with_pending_invoices
    Customer.find_by_sql("SELECT customers.* FROM customers
                         INNER JOIN invoices ON customers.id=invoices.customer_id
                         INNER JOIN merchants ON invoices.merchant_id=merchants.id
                         INNER JOIN transactions ON invoices.id=transactions.invoice_id
                         WHERE merchants.id=#{self.id} AND transactions.result='failed'
                         EXCEPT SELECT customers.* FROM customers
                         INNER JOIN  invoices ON customers.id=invoices.customer_id
                         INNER JOIN merchants ON invoices.merchant_id=merchants.id
                         INNER JOIN transactions ON invoices.id=transactions.invoice_id
                         WHERE merchants.id=#{self.id} AND transactions.result='success'
")
  end


end
