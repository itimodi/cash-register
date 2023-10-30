require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:product) { create(:product) }
  let(:cart) { create(:cart) }

  it "is valid with valid attributes" do
    line_item = LineItem.new(product: product, cart: cart, quantity: 1)
    expect(line_item).to be_valid
  end

  it "is not valid without a product" do
    line_item = LineItem.new(cart: cart, quantity: 1)
    expect(line_item).to_not be_valid
  end

  it "is not valid without a cart" do
    line_item = LineItem.new(product: product, quantity: 1)
    expect(line_item).to_not be_valid
  end

  it "is not valid with a non-integer quantity" do
    line_item = LineItem.new(product: product, cart: cart, quantity: "abc")
    expect(line_item).to_not be_valid
  end

  it "is not valid with a quantity less than 1" do
    line_item = LineItem.new(product: product, cart: cart, quantity: 0)
    expect(line_item).to_not be_valid
  end
end
