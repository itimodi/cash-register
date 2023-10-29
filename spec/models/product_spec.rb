require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with valid attributes' do
    product = Product.new(
      name: 'Coffee',
      product_code: 'SR1',
      price: 19.99
    )
    expect(product).to be_valid
  end

  it 'is not valid without a name' do
    product = Product.new(name: nil, product_code: 'SR1', price: 19.99)
    expect(product).not_to be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without a product code' do
    product = Product.new(name: 'Coffee', product_code: nil, price: 19.99)
    expect(product).not_to be_valid
    expect(product.errors[:product_code]).to include("can't be blank")
  end

  it 'is not valid with a duplicate product code' do
    # Create a product with a unique product code
    Product.create(name: 'Product 1', product_code: 'SR1', price: 19.99)
    
    # Attempt to create another product with the same product code
    product = Product.new(name: 'Product 2', product_code: 'SR1', price: 29.99)
    expect(product).not_to be_valid
    expect(product.errors[:product_code]).to include('has already been taken')
  end

  it 'is not valid with a non-positive price' do
    product = Product.new(name: 'Coffee', product_code: 'SR1', price: -10.0)
    expect(product).not_to be_valid
    expect(product.errors[:price]).to include('must be greater than 0')
  end
end
