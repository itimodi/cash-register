# frozen_string_literal: true
# This module serves as the base for pricing rules

module PricingRules
  class Base < ApplicationRecord
    self.table_name = 'pricing_rules'

    def initialize(rule_params)
      @rule_params = rule_params
    end

    # Implement a method to calculate the discounted price based on the rule_params
    # Subclasses must override this method to provide specific pricing logic.
    # @param quantity [Integer]
    # @param price [Float] The original price of the product.
    #
    # @return [Float] The discounted price based on the rule parameters.
    def discounted_price(quantity, price)
      raise NotImplementedError, 'Subclasses must implement apply_discount'
    end
  end
end
