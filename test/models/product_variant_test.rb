require 'test_helper'

class ProductVariantTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test "it should validate presence of product" do
    product_variant = build(:product_variant, product: nil)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:product]
  end

  test "it should validate presence of stock" do
    product_variant = build(:product_variant, stock: nil)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:stock]
  end  

  test "it should validate numericality of stock" do
    product_variant = build(:product_variant, stock: -1)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:stock]
  end

  test "it should validate presence of price" do
    product_variant = build(:product_variant, price: nil)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:price]
  end  

  test "it should validate numericality of price" do
    product_variant = build(:product_variant, price: -1)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:price]
  end

  test "it should validate numericality of discount" do
    product_variant = build(:product_variant, discount: -1)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:discount]
  end  

  test "it should validate presence of sku" do
    product_variant = build(:product_variant, sku: nil)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:sku]
  end 

  test "it should validate uniqueness of sku" do
    category = create(:category, name: "Test Cat")
    product = create(:product, name: "Test Product", code: "C", category: category)
    size = create(:size, name: "Large", code: "L")
    color = create(:color, name: "Blue")
    create(:product_variant, product: product, sku: "C-001")
    product_variant = build(:product_variant, product: product, sku: "C-001", size: size, color: color)
    refute product_variant.valid?
    assert_not_nil product_variant.errors[:sku]
  end 

  test "it sets final price before save" do
    category = create(:category, name: "Test Cat")
    product = create(:product, name: "Test Product", code: "C", category: category)
    size = create(:size, name: "Large", code: "L")
    color = create(:color, name: "Blue")
    product_variant = create(:product_variant, product: product, sku: "C-001", price: 100, discount: 50)

    assert_equal(50, product_variant.final_price)
  end

  test "it respond to pagination" do
    assert_respond_to(Product, :pages)
  end 

  test "enabled scope only gets enabled items" do
    category = create(:category, name: "Test Cat")
    size = create(:size, name: "Large", code: "L")
    color = create(:color, name: "Blue")
    4.times do |n|
      enabled = n.odd? ? true : false
      product = create(:product, category: category, name: "Product #{n}", code: "P-#{n}", description: "Desc #{n}", enabled: enabled)
      create(:product_variant, product: product, sku: "#{product.code}-#{n}", size: size, color: color)
    end

    assert_equal(2, ProductVariant.enabled.count)
  end

  test "category scope filters items by category" do
    category_odd = create(:category, name: "Test Cat 1")
    category_even = create(:category, name: "Test Cat 2")
    size = create(:size, name: "Large", code: "L")
    color = create(:color, name: "Blue")
    4.times do |n|
      enabled = n.odd? ? true : false
      category = n.odd? ? category_odd : category_even
      product = create(:product, category: category, name: "Product #{n}", code: "P-#{n}", description: "Desc #{n}", enabled: enabled)
      create(:product_variant, product: product, sku: "#{product.code}-#{n}", size: size, color: color)
    end

    assert_equal(2, ProductVariant.by_category(category_odd.id).count)
  end

  test "search scope filters items by search term" do
    category = create(:category, name: "Test Cat")
    size = create(:size, name: "Large", code: "L")
    color = create(:color, name: "Blue")
    4.times do |n|
      enabled = n.odd? ? true : false
      product = create(:product, category: category, name: "Product #{n}", code: "P-#{n}", description: "Desc #{n}", enabled: enabled)
      create(:product_variant, product: product, sku: "#{product.code}-#{n}", size: size, color: color)
    end

    assert_equal(1, ProductVariant.search("Product 1").count)
  end      
end
