class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("random()").first
  end

  def favorite_merchant
    merchants.customers_fav_merchant
  end

end
