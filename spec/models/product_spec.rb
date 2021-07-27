require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before {@category = Category.create(name: "Crafts")}
  #! test 1
  it 'should save successfully when given a value for all fields' do
    @product =
      Product.create(
        name: 'Product',
        price: 100,
        quantity: 4,
        category_id: @category[:id],
      ).save
    expect(@product).to eq(true)
  end

  describe 'validations' do
    #! test 
    it "validates name" do
      @product = Product.create(
        name: nil,
        price: 40,
        quantity: 10,
        category_id: @category[:id] 
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
      # puts "Product is #{@product.inspect} "
    end
    #! test 
    xit "should validate price" do
      @product = Product.create(
        name: 'Product',
        price: nil,
        quantity: 10,
        category_id: @category[:id]
      )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    #! test 
    it "should validate quantity" do
      @product = Product.create(
        name: 'Product',
        price: 40,
        quantity: nil,
        category_id: @category[:id]
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    #! test 
    it "should validate category" do
      @product = Product.create(
        name: 'Product',
        price: 40,
        quantity: 10,
        category_id: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
