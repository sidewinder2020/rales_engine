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
    .where('transactions.result = ?', 'success')
    .select("invoice_items.invoice_id as inv_id, count(invoice_items.invoice_id) as total")
    .group(:inv_id)
    .order('total DESC')
    .limit(limit)
  end
end
