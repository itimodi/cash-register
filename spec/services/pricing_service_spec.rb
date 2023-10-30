# spec/services/pricing_service_spec.rb

require 'rails_helper'

RSpec.describe PricingService do
  let(:product) { create(:product, price: 5.0) }

  describe '.calculate_total_price_for_cart for BulkDiscount' do
    let!(:pricing_rule) { create(:pricing_rule, product: product, rule_type: 'BulkDiscount', is_active: true, rule_params: { 'min_quantity' => 3, 'flat_discount' => 1.0 }) }
    let!(:cart) { create(:cart) }
    let!(:line_item) { create(:line_item, cart: cart, product: product, quantity: 1) }

    it 'calculates total prices for no pricing rule applied' do
      # Calculate total prices
      result = PricingService.calculate_total_price_for_cart(cart)
      expect(result[cart.line_items.first]).to eq 5.00
    end

    it 'increase quantity to calculates total prices for cart' do
      # update line_item quantity
      line_item.quantity += 3
      line_item.save

      # Calculate total prices
      result = PricingService.calculate_total_price_for_cart(cart)

      expect(result[cart.line_items.first]).to eq 16.00

    end
  end

  describe '.calculate_total_price_for_cart for Bogo' do
    let!(:pricing_rule) { create(:pricing_rule, product: product, rule_type: 'Bogo', is_active: true, rule_params: { 'buy' => 1, 'get' => 1 }) }
    let!(:cart) { create(:cart) }
    let!(:line_item) { create(:line_item, cart: cart, product: product, quantity: 1) }

    it 'calculates total prices for no pricing rule applied' do
      # Calculate total prices
      result = PricingService.calculate_total_price_for_cart(cart)
      expect(result[cart.line_items.first]).to eq 5.00
    end

    it 'calculates total prices when pricing rule applied' do
      # update line_item quantity
      line_item.quantity += 1
      line_item.save

      # Calculate total prices
      result = PricingService.calculate_total_price_for_cart(cart)

      expect(result[cart.line_items.first]).to eq 5.00

    end
  end
end
