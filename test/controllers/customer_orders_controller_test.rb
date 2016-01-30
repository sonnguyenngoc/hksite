require 'test_helper'

class CustomerOrdersControllerTest < ActionController::TestCase
  setup do
    @customer_order = customer_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_order" do
    assert_difference('CustomerOrder.count') do
      post :create, customer_order: { orderer_address_1: @customer_order.orderer_address_1, orderer_address_2: @customer_order.orderer_address_2, orderer_company_name: @customer_order.orderer_company_name, orderer_email: @customer_order.orderer_email, orderer_fax: @customer_order.orderer_fax, orderer_first_name: @customer_order.orderer_first_name, orderer_last_name: @customer_order.orderer_last_name, orderer_message: @customer_order.orderer_message, orderer_phone: @customer_order.orderer_phone }
    end

    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should show customer_order" do
    get :show, id: @customer_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_order
    assert_response :success
  end

  test "should update customer_order" do
    patch :update, id: @customer_order, customer_order: { orderer_address_1: @customer_order.orderer_address_1, orderer_address_2: @customer_order.orderer_address_2, orderer_company_name: @customer_order.orderer_company_name, orderer_email: @customer_order.orderer_email, orderer_fax: @customer_order.orderer_fax, orderer_first_name: @customer_order.orderer_first_name, orderer_last_name: @customer_order.orderer_last_name, orderer_message: @customer_order.orderer_message, orderer_phone: @customer_order.orderer_phone }
    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should destroy customer_order" do
    assert_difference('CustomerOrder.count', -1) do
      delete :destroy, id: @customer_order
    end

    assert_redirected_to customer_orders_path
  end
end
