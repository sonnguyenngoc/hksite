class AllNewProductController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @products = Product.get_new_products(params).paginate(:page => params[:page], :per_page => 15)
      @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
