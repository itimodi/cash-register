require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe '#total_items' do
    it 'calculates the total quantity of items in the cart' do
      cart = create(:cart)
      product1 = create(:product)
      product2 = create(:product)
      create(:line_item, cart: cart, product: product1, quantity: 2)
      create(:line_item, cart: cart, product: product2, quantity: 3)

      expect(cart.total_items).to eq(5)
    end

    it 'returns 0 for an empty cart' do
      cart = create(:cart)
      expect(cart.total_items).to eq(0)
    end
  end
end
