require 'rails_helper'

RSpec.describe PricingRule, type: :model do
  # Create a product
  let(:product) { create(:product) }

  it "is not valid without a rule_type" do
    pricing_rule = PricingRule.new(product: product)
    expect(pricing_rule).to_not be_valid
  end

  context 'apply_discount' do
    it 'calls apply_discount on the associated rule instance' do
      rule = create(:pricing_rule, product: product, rule_type: 'Bogo', rule_params: { 'buy' => 1, 'get' => 1 })
      quantity = 2
      price = 10.0

      # Stub the dynamic rule class and its apply_discount method
      rule_class = PricingRules::Bogo

      # Call the apply_discount method
      rule_instance = rule_class.new(rule.rule_params)
      discounted_price = rule_instance.discounted_price(quantity, price)

      expect(discounted_price).to eq(10.00)
    end
  end
end

