# app/models/line_item.rb
# frozen_string_literal: true
# This class represents a line item in a shopping cart, linking a product to a cart with a specific quantity.

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validates :quantity, presence: true, numericality: { greater_than: 0 }

end
