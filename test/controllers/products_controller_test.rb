require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  setup do
    @product = create(:product)
    @category = create(:category, name: "Test Cat")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { category_id: @category.id, description: "Test Product", enabled: true, name: "Test Product", code: "TPC" }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { category_id: @product.category_id, description: @product.description, enabled: @product.enabled, name: @product.name, code: @product.code }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
