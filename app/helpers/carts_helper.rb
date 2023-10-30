module CartsHelper

  # Calculate total price of all cart items
  # @params cart_items [Hash]
  # @return [Float] example: 25.50
  def total_price(cart_items)
    cart_items.values.sum
  end
end
