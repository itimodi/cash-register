FactoryBot.define do
  factory :pricing_rule do
    product
    rule_type { 'Bogo' }
  end
end