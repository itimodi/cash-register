# app/models/cart.rb
# frozen_string_literal: true

# This class represents a shopping cart in our shopping application.
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  # Calculate the total number of items in the shopping cart.
  #
  # @return [Integer] The total number of items in the cart.
  def total_items
    line_items.sum(:quantity)
  end
end
