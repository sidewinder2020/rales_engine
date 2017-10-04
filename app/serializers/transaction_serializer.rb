class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :invoice_id, :result

  def credit_card_number
    object.credit_card_number_string
  end

end
