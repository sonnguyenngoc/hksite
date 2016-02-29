class ManufacturerPageController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @manufacturer = Manufacturer.find(params[:manufacturer_id])
      @products = Product.get_by_manufacturer(params).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
      @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
