class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price

  def unit_price
    object.unit_price_to_2_sig_figs
  end

end