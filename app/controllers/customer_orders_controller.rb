class CustomerOrdersController < ApplicationController

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @customer_order = CustomerOrder.new(customer_order_params)

    respond_to do |format|
      if @customer_order.save
        @customer_order.save_from_cart(@cart)
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to root_path, notice: 'Gửi đơn đặt hàng thành công.' }
        format.json { render :show, status: :created, location: @customer_order }
      else
        format.html { render :new }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirm_order
    @customer_order = CustomerOrder.new(customer_order_params)

    respond_to do |format|
      if @customer_order.save
        @cart.line_items.each do |item|
          @customer_order.customer_order_details.create()
        end
        format.html { redirect_to root_path, notice: 'Gửi đơn đặt hàng thành công.' }
        format.json { render :show, status: :created, location: @customer_order }
      else
        format.html { render :new }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:orderer_first_name, :orderer_last_name, :orderer_company_name, :orderer_email, :orderer_address_1, :orderer_address_2, :orderer_phone, :orderer_fax, :orderer_message, order_details_attributes: [:id, :order_id, :product_id, :quantity, :_destroy])
    end
end
