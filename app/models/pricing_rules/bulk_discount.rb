# frozen_string_literal: true
# This module represents a pricing rule for Bulk Discounts
module PricingRules
  class BulkDiscount < Base
    # Calculate the discounted price based on the Bulk Discount rule logic.
    # @param quantity [Integer] The quantity of items to calculate the price for.
    # @param price [Float] The original price of the product.
    # @return [Float] The discounted price based on the Bulk Discount logic.
    def discounted_price(quantity, price)
      # Bulk Discount rule logic
      return price * quantity if quantity < @rule_params['min_quantity']

      if @rule_params['flat_discount'].present?
        (price - @rule_params['flat_discount']) * quantity
      elsif @rule_params['percentage_discount'].present?
        (price - (price * (@rule_params['percentage_discount'] / 100))) * quantity
      else
        price * quantity
      end
    end
  end
end
