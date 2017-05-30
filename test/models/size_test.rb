require 'test_helper'

class SizeTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test "it should validate presence of name" do
    size = build(:size, name: nil)
    refute size.valid?
    assert_not_nil size.errors[:name]
  end

  test "it should validate uniqueness of name" do
    create(:size, name: "Medium", code: "M")
    size = build(:size, name: "Medium")
    refute size.valid?
    assert_not_nil size.errors[:name]
  end 

  test "it should validate presence of code" do
    size = build(:size, code: nil)
    refute size.valid?
    assert_not_nil size.errors[:code]
  end 

  test "it should validate uniqueness of code" do
    create(:size, name: "Large", code: "L")
    size = build(:size, code: "L")
    refute size.valid?
    assert_not_nil size.errors[:code]
  end 

  test "it is valid with required fields" do
    size = build(:size, name: "Extra Large", code: "XL")
    assert size.valid?
  end

  test "it respond to pagination" do
    assert_respond_to(Product, :pages)
  end    
end
