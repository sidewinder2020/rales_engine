FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "Sal#{n}" }
    sequence(:last_name) {|n| "Espinosa#{n}"}
    created_at "2012-03-27 14:53:59 UTC"
    updated_at "2012-03-28 14:53:59 UTC"
  end
end
