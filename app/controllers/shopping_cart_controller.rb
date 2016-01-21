class ShoppingCartController < ApplicationController
  def index
    @message = Message.new
    @company_info = Contact.find(1)
    
    @cart.remove_item(params[:line_item_id]) if params[:do] == "remove_item"
    
  end
end
