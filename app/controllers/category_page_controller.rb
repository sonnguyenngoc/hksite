class CategoryPageController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @category = Menu.find(params[:category_id])
      @products = @category.get_products_for_categories(params).paginate(:page => params[:page], :per_page => 15)
      @manufacturers = Manufacturer.all
      @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
