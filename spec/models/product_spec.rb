require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.create(name: 'Test Category')
    end

    it "should save and has all required fields" do
      product = Product.new(name: 'Test Product', price: 500, quantity: 25, category: @category)
      expect(product).to be_valid
    end

    it "should not save if name is not valid" do
      product = Product.new(name: nil, price: 500, quantity: 25, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not save if price is not valid" do
      product = Product.new(name: 'Test Product', quantity: 25, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not save if quantity is not valid" do
      product = Product.new(name: 'Test Product', price: 500, quantity: nil, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not save if category is not valid" do
      product = Product.new(name: 'Test Product', price: 500, quantity: 25, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
