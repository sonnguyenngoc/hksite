class HomeController < ApplicationController
  def index
    @message = Message.new
    @newsletter = Newsletter.new
    @blog = Article.order("created_at DESC").first(3)
    @class_body = "front_page"
    @contact = Contact.find(1)
    @product = Product.order("created_at DESC").first(15)
  end
end
