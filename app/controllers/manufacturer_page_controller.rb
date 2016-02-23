class ManufacturerPageController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @manufacturer = Manufacturer.find(params[:id])
      @products = Product.get_by_manufacturer(params).first(15)
      @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
