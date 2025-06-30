FactoryBot.define do
  factory :order do
    user { nil }
    status { "MyString" }
    total { "9.99" }
    payment_method { "MyString" }
    external_id { "MyString" }
    paid_at { "2025-06-27 22:47:45" }
  end
end
