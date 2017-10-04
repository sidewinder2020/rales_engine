class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.random
    order("random()").first
  end

  def unit_price_string_2_sig_figs
    (unit_price / 100.0).to_s
  end
end
