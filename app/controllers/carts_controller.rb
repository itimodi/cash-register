# frozen_string_literal: true
# Controller for managing shopping carts in the application.

class CartsController < ApplicationController
  def show
    @cart_items = PricingService.calculate_total_price_for_cart(@cart)
  end
end
