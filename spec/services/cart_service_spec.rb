require 'rails_helper'

RSpec.describe CartService, type: :service do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }

  describe '#add_product' do
    it 'adds a product to the cart' do
      cart_service = CartService.new(cart)
      cart_service.add_product(product)

      # Reload the cart from the database to get the updated line items
      cart.reload

      expect(cart.line_items.first.product).to eq(product)
      expect(cart.line_items.first.quantity).to eq(1)
    end

    it 'increments the quantity for an existing product' do
      cart_service = CartService.new(cart)
      cart_service.add_product(product)
      cart_service.add_product(product)

      # Reload the cart from the database to get the updated line items
      cart.reload

      expect(cart.line_items.first.product).to eq(product)
      expect(cart.line_items.first.quantity).to eq(2)
    end
  end
end
