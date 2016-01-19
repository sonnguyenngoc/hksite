class HomeController < ApplicationController
  def index
    @message = Message.new
    @newsletter = Newsletter.new
    @blog = Article.order("created_at DESC").first(3)
    @class_body = "front_page"
    @product = Product.order("created_at DESC").first(12)
    @product_image = ProductImage.order("created_at DESC").first(1)
    @product_price = ProductPrice.order("created_at DESC").first(12)
    @company_info = Contact.find(1)
  end
end
