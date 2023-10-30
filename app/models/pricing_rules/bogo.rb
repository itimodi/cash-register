# frozen_string_literal: true
# This module represents a pricing rule for Buy One Get One Free

module PricingRules
  class Bogo < Base

    # Calculate the discounted price based on the BOGO (Buy One Get One Free) rule logic.
    # @param quantity [Integer] The quantity of items to calculate the price for.
    # @param price [Float] The original price of the product.
    # @return [Float] The discounted price based on the Bogo logic
    def discounted_price(quantity, price)
      # Bogo (Buy One Get One Free) rule logic
      return product_price * quantity if quantity < @rule_params['buy']

      buy = @rule_params['buy'].to_i
      get = @rule_params['get'].to_i
      pairs = quantity / (buy + get)
      remaining = quantity % (buy + get)
      price * (pairs * buy + remaining)
    end
  end
end
