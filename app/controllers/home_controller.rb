class HomeController < ApplicationController
  def index
    @newsletter = Newsletter.new
    @message = Message.new
    @menu = Menu.all
    @company_info = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
    @blog = Article.get_all_articles.first(3)
    @product = Product.last(12)
    @slideshow = SlideShow.get_slideshows
    @new_blog_footer = Article.get_all_articles.first(3)
    @partners = Partner.order("created_at DESC").first(28)
    @hot_products = Product.get_hot_products(params).limit(20)
    @sale_products = Product.get_sale_products(params).limit(6)
    @bestseller_products = Product.get_bestseller_products(params).limit(20)
    @prominent_products = Product.get_prominent_products(params).limit(20)
    @new_products = Product.get_new_products(params).limit(8)
    @manual_new_products = Product.get_new_products_manual(params).limit(12)
  end
end
