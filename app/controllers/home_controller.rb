class HomeController < ApplicationController
  def index
    @newsletter = Newsletter.new
    @message = Message.new
    @menu = Menu.all
    @company_info = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
    @blog = Article.order("created_at DESC").first(3)
    @product = Product.last(12)
    @slideshow = SlideShow.get_slideshows
    @new_blog_footer = Article.order("created_at DESC").first(3)
    @partners = Partner.order("created_at DESC").first(20)
    
    @hot_products = Product.get_hot_products(params).limit(9)
    @sale_products = Product.get_sale_products(params).limit(6)
    @bestseller_products = Product.get_bestseller_products(params).limit(9)
    @prominent_products = Product.get_prominent_products(params).limit(9)
    @new_products = Product.get_new_products(params).limit(9)
  end
end
