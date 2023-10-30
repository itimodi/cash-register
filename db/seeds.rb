# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:

# Product

Product.destroy_all
product1 = Product.create({product_code: 'GR1', name: 'Green Tea', price: 3.11})
product2 = Product.create({product_code: 'SR1', name: 'Strawberries', price: 5.00})
product3 = Product.create({product_code: 'CF1', name: 'Coffee', price: 11.23})

# Create active pricing rules
PricingRule.create!(
  product: product1,
  rule_type: 'Bogo',
  is_active: true,      # Set as active
  rule_params: { 'buy' => 1, 'get' => 1 }
)

PricingRule.create!(
  product: product2,
  rule_type: 'BulkDiscount',
  is_active: true,		# Set as active
  rule_params: { 'min_quantity' => 3, 'flat_discount' => 0.5 }
)

PricingRule.create!(
  product: product3,
  rule_type: 'BulkDiscount',
  is_active: true,		# Set as active
  rule_params: { 'min_quantity' => 3, 'percentage_discount' => 33.33 }
)
