FactoryGirl.define do
  factory :invoice do

    status "shipped"
    created_at "2012-03-27 14:53:59 UTC"
    updated_at "2012-03-28 14:53:59 UTC"

    merchant
    customer
  end
end
