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
end
