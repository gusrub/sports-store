require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  
  test "it should validate presence of name" do
    category = build(:category, name: nil)
    refute category.valid?
    assert_not_nil category.errors[:name]
  end

  test "it should validate uniqueness of name" do
    create(:category, name: "memorabilia")
    category = build(:category, name: "memorabilia")
    refute category.valid?
    assert_not_nil category.errors[:name]
  end 

  test "it is valid with required fields" do
    category = build(:category, name: "memorabilia")
    assert category.valid?
  end

  test "it respond to pagination" do
    assert_respond_to(Product, :pages)
  end 

end
