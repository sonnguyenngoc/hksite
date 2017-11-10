class CheckOutController < ApplicationController
  def index
    @customer_order = CustomerOrder.new
  end
end
