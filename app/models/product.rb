class Product < ApplicationRecord
	validates :name, :product_code, presence: true
	validates :product_code, uniqueness: true
	validates :price, numericality: { greater_than: 0 }
end
