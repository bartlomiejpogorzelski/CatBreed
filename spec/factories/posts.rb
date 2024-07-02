FactoryBot.define do
  factory :post do
    title { "Example Title" }
    content { "Example content" }
    association :user
  end
end