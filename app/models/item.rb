class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(:id) }
  def random
    order("random()").first
  end

  def unit_price_to_2_sig_figs
    (unit_price / 100.0).to_s
  end

  def self.most_revenue(limit_quantity)
    unscoped
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as item_revenue")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("item_revenue DESC")
    .limit(limit_quantity)
  end

  def self.most_items(limit = 5)
    unscoped
    .joins(invoice_items: [invoice: [:transactions]])
    .select('items.*, sum(invoice_items.quantity) as most_items')
    .where('transactions.result = ?', 'success')
    .order('most_items DESC')
    .group(:id)
    .limit(limit)
  end

  def best_day
    invoices.item_best_day
  end
end
