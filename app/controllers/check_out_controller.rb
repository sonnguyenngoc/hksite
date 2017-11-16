class CheckOutController < ApplicationController
  def index
    @menus = Menu.get_menus
    @customer_order = CustomerOrder.new
  end
end
