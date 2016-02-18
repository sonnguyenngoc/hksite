class ProductController < ApplicationController
  def index
    @menu = Menu.all
    @company_info = Contact.find(1)
    @category = Category.all.where(level: '1')
    @pro_detail = Product.find(params[:id])
    @message = Message.new
    @company_info = Contact.find(1)
    @product = Product.last(12)
    @product_infos = ProductInfo.all
    
    @favorite_products = Product.get_favorite_products
    @related_products = Product.get_related_products
  end
  
end
