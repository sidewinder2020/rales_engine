class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.random
    order("random()").first
  end
end
