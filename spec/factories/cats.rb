FactoryBot.define do
  factory :cat do
    name { "Example Cat" }
    breed { Cat::BREEDS.sample }
    status { 'available' }
  end
end