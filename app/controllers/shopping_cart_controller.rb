class ShoppingCartController < ApplicationController
  def index
    @menus = Menu.get_menus
    @cart.remove_item(params[:line_item_id]) if params[:do] == "remove_item"
    @title = 'Giỏ hàng'
  end
end
