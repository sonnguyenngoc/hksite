require 'test_helper'

class ProductInfosControllerTest < ActionController::TestCase
  setup do
    @product_info = product_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_info" do
    assert_difference('ProductInfo.count') do
      post :create, product_info: { description: @product_info.description, image_url: @product_info.image_url, old_price: @product_info.old_price, product_bestselled: @product_info.product_bestselled, product_hot: @product_info.product_hot, product_prominent: @product_info.product_prominent, product_sale: @product_info.product_sale }
    end

    assert_redirected_to product_info_path(assigns(:product_info))
  end

  test "should show product_info" do
    get :show, id: @product_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_info
    assert_response :success
  end

  test "should update product_info" do
    patch :update, id: @product_info, product_info: { description: @product_info.description, image_url: @product_info.image_url, old_price: @product_info.old_price, product_bestselled: @product_info.product_bestselled, product_hot: @product_info.product_hot, product_prominent: @product_info.product_prominent, product_sale: @product_info.product_sale }
    assert_redirected_to product_info_path(assigns(:product_info))
  end

  test "should destroy product_info" do
    assert_difference('ProductInfo.count', -1) do
      delete :destroy, id: @product_info
    end

    assert_redirected_to product_infos_path
  end
end
