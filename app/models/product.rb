# app/models/product.rb
# frozen_string_literal: true

# This class represents a product in our shopping application.
# A product has a name, a product code, and a price.
class Product < ApplicationRecord
  has_many :pricing_rules, dependent: :destroy

  validates :name, :product_code, presence: true
  validates :product_code, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
end
