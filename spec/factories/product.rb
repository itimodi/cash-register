# spec/factories/products.rb

FactoryBot.define do
  factory :product do
    name { 'Sample Product' }
    sequence(:product_code) { |n| "SAMPLE#{n}" }
    price { 10.00 }
  end
end
