class HomeController < ApplicationController
  def index
    @class_body = "front_page"
    @contact = Contact.find(1)
    @product = Product.order("created_at DESC").first(12)
  end
end
