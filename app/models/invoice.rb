class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.random
    order("random()").first
  end

   def self.invoice_total_revenue
    joins(:transactions, :invoice_items)
    .where('transactions.result = ?', 'success')
    .select("invoice_items.quantity * invoice_items.unit_price AS revenue")
    .map(&:revenue)
    .reduce(:+)
   end


end
