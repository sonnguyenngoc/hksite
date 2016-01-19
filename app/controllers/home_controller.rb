class HomeController < ApplicationController
  def index
    @class_body = "front_page"
    @newsletter = Newsletter.new
    @message = Message.new
    @company_info = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
    @blog = Article.order("created_at DESC").first(3)
  end
end
