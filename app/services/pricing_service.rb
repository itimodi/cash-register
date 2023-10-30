# frozen_string_literal: true
# Service class for calculating prices and total prices for shopping cart items.
class PricingService

  # Calculate the total price for a shopping cart, considering pricing rules.
  #
  # @param cart [Cart] The shopping cart.
  # @return [Hash] A hash with line items as keys and their total prices as values.
  def self.calculate_total_price_for_cart(cart)
    results = {}
    cart.line_items.each do |line_item|
      # Calculate the total price for the product
      total_price = calculate_price(line_item)

      results[line_item] = total_price
    end
    results
  end

  # Calculate the price for a line item, considering its associated product and pricing rules.
  #
  # @param line_item [LineItem] The line item to calculate the price for.
  # @return [Float] The calculated price for the line item.
  def self.calculate_price(line_item)
    product = line_item.product
    quantity = line_item.quantity
    return quantity * product.price unless product.pricing_rules

    prices = []

    product.pricing_rules.each do |pricing_rule|
      prices << pricing_rule.apply_discount(quantity, product.price)
    end

    prices.min
  end
end
