FactoryGirl.define do
  factory :invoice_item do

    quantity 5
    unit_price 13635
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"

    item
    invoice
  end
end
