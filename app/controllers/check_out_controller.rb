class CheckOutController < ApplicationController
  def index
    @menus = Menu.get_menus
    @customer_order = CustomerOrder.new
    
    if @cart.line_items.empty?
      redirect_to shopping_cart_path
      return
    end
  end
end
