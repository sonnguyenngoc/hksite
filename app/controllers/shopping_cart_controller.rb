class ShoppingCartController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @new_blog_footer = Article.order("created_at DESC").first(3)
    @new_products = Product.get_new_products.first(18)
    
    @cart.remove_item(params[:line_item_id]) if params[:do] == "remove_item"
    
  end
end
