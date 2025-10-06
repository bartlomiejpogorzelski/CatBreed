FactoryBot.define do
  factory :order_item do
    order { nil }
    product { nil }
    quantity { 1 }
    unit_price { "9.99" }
  end
end
