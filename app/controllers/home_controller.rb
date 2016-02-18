class HomeController < ApplicationController
  def index
    @newsletter = Newsletter.new
    @message = Message.new
    @menu = Menu.all
    @company_info = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
    @blog = Article.order("created_at DESC").first(3)
    @product = Product.last(12)
    @new_blog_footer = Article.order("created_at DESC").first(3)
    
    @hot_products = Product.get_hot_products
    @sale_products = Product.get_sale_products
    @bestseller_products = Product.get_bestseller_products
    @prominent_products = Product.get_prominent_products
    @new_products = Product.get_new_products
  end
end
