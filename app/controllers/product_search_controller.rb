class ProductSearchController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @new_blog_footer = Article.order("created_at DESC").first(3)
      @products = Product.search(params).order("name ASC").paginate(:page => params[:page], :per_page => 15)
  end
end
