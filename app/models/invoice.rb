class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.random
    order("random()").first
  end

  def self.total_revenue
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoices.id AND transactions.result = 'success'")
    .joins("INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
    .select("invoice_items.quantity * invoice_items.unit_price AS revenue")
    .map(&:revenue)
    .reduce(:+)
  end
end
