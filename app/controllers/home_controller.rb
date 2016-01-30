class HomeController < ApplicationController
  def index
    @newsletter = Newsletter.new
    @message = Message.new
    @menu = Menu.all
    @company_info = Contact.find(1)
    @product = Product.order("created_at DESC").first(3)
    @blog = Article.order("created_at DESC").first(3)
    @product = Product.last(12)
    @category = Category.all.where(level: '1')
    
    @hot_products = Product.get_hot_products
    @sale_products = Product.get_sale_products
    @bestseller_products = Product.get_bestseller_products
    @prominent_products = Product.get_prominent_products
    @new_products = Product.get_new_products
  end
end
