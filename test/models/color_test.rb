require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test "it should validate presence of name" do
    color = build(:color, name: nil)
    refute color.valid?
    assert_not_nil color.errors[:name]
  end

  test "it should validate uniqueness of name" do
    create(:color, name: "blue")
    color = build(:color, name: "blue")
    refute color.valid?
    assert_not_nil color.errors[:name]
  end

  test "it is valid with required fields" do
    color = build(:color, name: "blue")
    assert color.valid?
  end

  test "it respond to pagination" do
    assert_respond_to(Product, :pages)
  end  
end
