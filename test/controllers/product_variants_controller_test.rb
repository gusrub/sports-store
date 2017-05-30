require 'test_helper'

class ProductVariantsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  setup do
    @product_variant = create(:product_variant)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_variants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_variant" do
    assert_difference('ProductVariant.count') do
      params = { 
        product_id: @product_variant.product_id, 
        size_id: @product_variant.size_id, 
        color_id: @product_variant.color_id, 
        stock: @product_variant.stock, 
        price: @product_variant.price,
        discount: @product_variant.discount,
        final_price: 0, 
        sku: "TTC-001" 
      }      
      post :create, product_variant: params
    end

    assert_redirected_to product_variant_path(assigns(:product_variant))
  end

  test "should show product_variant" do
    get :show, id: @product_variant
    assert_response :success
  end

  test "should update product_variant" do
    patch :update, id: @product_variant, product_variant: { color_id: @product_variant.color_id, price: @product_variant.price, product_id: @product_variant.product_id, size_id: @product_variant.size_id, stock: @product_variant.stock }
    assert_redirected_to product_variant_path(assigns(:product_variant))
  end

  test "should destroy product_variant" do
    assert_difference('ProductVariant.count', -1) do
      delete :destroy, id: @product_variant
    end

    assert_redirected_to product_variants_path
  end
end
