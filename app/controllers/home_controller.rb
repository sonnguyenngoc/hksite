class HomeController < ApplicationController
  def index
    @class_body = "front_page"
    @contact = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
    #@product_image = ProductImage.order("created_at DESC").first(1)
  end
end
