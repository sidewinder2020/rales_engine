class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def random
    order("random()").first
  end

  def unit_price_to_2_sig_figs
    (unit_price / 100.0).to_s
  end

  def self.most_items(limit = 5)
    joins(invoice_items: [invoice: [:transactions]])
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
