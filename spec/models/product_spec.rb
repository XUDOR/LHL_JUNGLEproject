require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "Test Category")
    end
    
    it 'is valid with valid attributes' do
      product = @category.products.build(name: "Test Product", price: 100, quantity: 10)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = @category.products.build(name: nil, price: 100, quantity: 10)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = @category.products.build(name: "Test Product", price_cents: nil, quantity: 10)
      product.valid? # Trigger validation
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      product = @category.products.build(name: "Test Product", price: 100, quantity: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Test Product", price: 100, quantity: 10)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
