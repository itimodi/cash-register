# spec/helpers/carts_helper_spec.rb

require 'rails_helper'

# Include the helper module for testing
RSpec.configure do |config|
  config.include CartsHelper, type: :helper
end

RSpec.describe CartsHelper, type: :helper do
  describe '#total_price' do
    it 'calculates the total price of cart items' do
      # Create a sample cart_items hash for testing
      cart_items = {
        product1: 10.99,
        product2: 5.99,
        product3: 3.49
      }

      # Call the helper method and format the result
      result = helper.total_price(cart_items)

      expect(result).to eq 20.47
    end
  end
end
