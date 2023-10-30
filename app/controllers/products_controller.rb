# frozen_string_literal: true
# Controller for managing products in the application.

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
