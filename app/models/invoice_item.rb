class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.random
    order("random()").first
  end
end
