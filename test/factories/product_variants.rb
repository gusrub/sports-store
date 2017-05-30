FactoryGirl.define do
  factory :product_variant do
    association :product
    association :size
    association :color
    stock 1
    price "9.99"
    discount 0
    final_price 0
    sku "TP-001"
  end
end
