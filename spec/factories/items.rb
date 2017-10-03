FactoryGirl.define do
  factory :item do
    name "Skeleton"
    description "Bones"
    unit_price 10000
    created_at "2012-03-27 14:53:59 UTC"
    updated_at "2012-03-28 14:53:59 UTC"

    merchant
  end
end
