# frozen_string_literal: true
# Controller for managing line items in a shopping cart.

class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:add, :reduce]
  
  def create
    product = Product.find(params[:product_id])

    cart_service = CartService.new(@cart)
    cart_service.add_product(product)

    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  # Increment the quantity of the selected line item.
  def add
    @line_item.increment(:quantity)
    @line_item.save
    redirect_to cart_path(@cart)
  end

  # Decrement the quantity of the selected line item or remove it if the quantity is 1.
  def reduce
    if @line_item.quantity > 1
      @line_item.decrement(:quantity)
      @line_item.save
    else
      @line_item.destroy
    end
    redirect_to cart_path(@cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
