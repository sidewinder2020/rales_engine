class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.random
    order("random()").first
  end
end
