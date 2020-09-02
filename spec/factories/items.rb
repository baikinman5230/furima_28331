FactoryBot.define do
  factory :item do
    product {"絵本"}
    discription {Faker::Lorem.sentence}
    price {"5000"}
    category_id {"2"}
    product_condition_id {"2"}
    shipping_fee_burde_id {"2"}
    shipping_region_id {"2"}
    days_until_shipping_id {"2"}
    association :user
  end
end
