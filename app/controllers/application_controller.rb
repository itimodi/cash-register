# frozen_string_literal: true
# Base class for all controllers in our application.

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart

  private
    # Get the current shopping cart or create a new one if none exists.
    #
    # @return [Cart] The current shopping cart.
    def current_cart
      @cart = Cart.find_by(id: session[:cart_id])

      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
end
