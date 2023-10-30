# frozen_string_literal: true
# Service class for managing a shopping cart by adding products.
class CartService
  def initialize(cart)
    @cart = cart
  end

  # Add a product to the shopping cart, incrementing the quantity if the product is already present.
  #
  # @param product [Product] The product to be added to the cart.
  def add_product(product)
    line_item = @cart.line_items.find_or_initialize_by(product: product)
    line_item.quantity += 1 unless line_item.new_record?
    line_item.save
  end
end
