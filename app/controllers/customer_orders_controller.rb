class CustomerOrdersController < ApplicationController

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @customer_order = CustomerOrder.new(customer_order_params)

    if @customer_order.save
      @customer_order.save_from_cart(@cart)
      OrderMailer.customer_order_email(@customer_order).deliver_now
      OrderMailer.confirm_customer_order_email(@customer_order).deliver_now
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      
      redirect_to finish_checkout_path, notice: 'Gửi đơn đặt hàng thành công.'
    else
      redirect_back(fallback_location: @customer_order, notice: "Thông tin đặt hàng chưa được gửi. Vui lòng kiểm tra và thử lại?")
    end
  end
  
  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:is_invoice, :orderer_first_name, :orderer_last_name, :orderer_company_name, :orderer_email, :orderer_address_1, :orderer_address_2, :orderer_phone, :orderer_fax, :orderer_tax, :orderer_message, order_details_attributes: [:id, :order_id, :product_id, :quantity, :_destroy])
    end
end
