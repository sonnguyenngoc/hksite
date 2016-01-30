class ShoppingCartController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    
    @cart.remove_item(params[:line_item_id]) if params[:do] == "remove_item"
    
  end
end
