require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test "it should validate presence of category" do
    product = build(:product, category: nil)
    refute product.valid?
    assert_not_nil product.errors[:category]
  end

  test "it should validate presence of name" do
    product = build(:product, name: nil)
    refute product.valid?
    assert_not_nil product.errors[:category]
  end 

  test "it should validate uniqueness of name" do
    category = create(:category, name: "Caps")
    create(:product, name: "Cap", category: category)
    product = build(:product, name: "Cap")
    refute product.valid?
    assert_not_nil product.errors[:name]
  end   

  test "it should validate presence of code" do
    product = build(:product, code: nil)
    refute product.valid?
    assert_not_nil product.errors[:code]
  end 

  test "it should validate uniqueness of code" do
    category = create(:category, name: "Caps")
    create(:product, code: "C001", category: category)
    product = build(:product, code: "C001")
    refute product.valid?
    assert_not_nil product.errors[:code]
  end   

  test "it should validate presence of description" do
    product = build(:product, description: nil)
    refute product.valid?
    assert_not_nil product.errors[:description]
  end 

  test "it is valid with required fields" do
    category = create(:category, name: "Caps")
    product = build(:product, name: "Baseball Cap", code: "CAP-001", category: category, description: "Just a Cap!")
    assert product.valid?
  end

  test "enabled scope only gets enabled items" do
    category = create(:category)
    4.times do |n|
      enabled = n.odd? ? true : false
      create(:product, category: category, name: "Product #{n}", code: "P-#{n}", description: "Desc #{n}", enabled: enabled)
    end

    assert_equal(2, Product.enabled.count)
  end

  test "featured scope only gets featured items" do
    category = create(:category)
    4.times do |n|
      featured = n.odd? ? true : false
      create(:product, category: category, name: "Product #{n}", code: "P-#{n}", description: "Desc #{n}", featured: featured)
    end

    assert_equal(2, Product.featured.count)
  end

  test "it respond to pagination" do
    assert_respond_to(Product, :pages)
  end    
end
