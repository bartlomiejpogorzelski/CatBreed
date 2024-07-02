FactoryBot.define do
  factory :comment do
    association :post
    association :user
    body { "Test comment" } 
  end
end
