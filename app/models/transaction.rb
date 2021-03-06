class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful,          -> { where(result:'success')}
  scope :failed,              -> { where(result:'failed')}

  def self.random
    order("random()").first
  end

  def credit_card_number_string
    credit_card_number.to_s
  end
end
