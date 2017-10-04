class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.random
    order("random()").first
  end

  def credit_card_number_string
    credit_card_number.to_s
  end
end
