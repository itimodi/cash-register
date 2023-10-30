# app/models/pricing_rule.rb
# frozen_string_literal: true

# This class represents a pricing rule for products in our shopping application.
class PricingRule < ApplicationRecord
  belongs_to :product

  # Validations
  validates :rule_type, presence: true

  # Constants for rule types
  BOGO = 'Bogo'
  BULK_DISCOUNT = 'BulkDiscount'

  # Define methods for different pricing rules
  def apply_discount(quantity, price)
    # Dynamically create an instance of the pricing rule class based on rule_type
    rule_class = "PricingRules::#{rule_type}".constantize
    rule_instance = rule_class.new(rule_params)

    # Call the discounted_price method on the dynamically created instance
    rule_instance.discounted_price(quantity, price)
  end
end
