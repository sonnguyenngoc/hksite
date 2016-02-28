class Admin::CustomerOrdersController < ApplicationController
  before_action :set_customer_order, only: [:show, :edit, :update, :destroy]

  # GET /customer_orders
  # GET /customer_orders.json
  def index
    @customer_orders = CustomerOrder.all
  end

  # GET /customer_orders/1
  # GET /customer_orders/1.json
  def show
  end

  # GET /customer_orders/new
  def new
    @customer_order = CustomerOrder.new
  end

  # GET /customer_orders/1/edit
  def edit
  end

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @customer_order = CustomerOrder.new(customer_order_params)

    respond_to do |format|
      if @customer_order.save
        format.html { redirect_to [:admin, @customer_order], notice: 'Gửi đơn đặt hàng thành công.' }
        format.json { render :show, status: :created, location: @customer_order }
      else
        format.html { render :new }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_orders/1
  # PATCH/PUT /customer_orders/1.json
  def update
    respond_to do |format|
      if @customer_order.update(customer_order_params)
        format.html { redirect_to [:admin, @customer_order], notice: 'Customer order was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_order }
      else
        format.html { render :edit }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_orders/1
  # DELETE /customer_orders/1.json
  def destroy
    @customer_order.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, @customer_order], notice: 'Customer order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:orderer_first_name, :orderer_last_name, :orderer_company_name, :orderer_email, :orderer_address_1, :orderer_address_2, :orderer_phone, :orderer_fax, :orderer_tax, :orderer_message, customer_order_details_attributes: [:id, :customer_order_id, :product_id, :price,:quantity, :_destroy])
    end
end
