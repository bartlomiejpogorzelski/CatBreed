FactoryBot.define do
  factory :shipment do
    order { nil }
    carrier { "MyString" }
    tracking_number { "MyString" }
    status { "MyString" }
    label_url { "MyText" }
  end
end
