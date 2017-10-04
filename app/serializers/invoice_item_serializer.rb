class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price

  def unit_price
    object.unit_price_string_2_sig_figs
  end
end
