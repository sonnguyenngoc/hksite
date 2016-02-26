class ProductController < ApplicationController
  def index
    @menu = Menu.all
    @company_info = Contact.find(1)
    @pro_detail = Product.find(params[:id])
    @message = Message.new
    @company_info = Contact.find(1)
    @product = Product.last(12)
    @product_infos = ProductInfo.all
    @new_blog_footer = Article.order("created_at DESC").first(3)
    
    @related_products = Product.get_related_products
  end  
end
