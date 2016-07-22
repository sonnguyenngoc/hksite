class CategoryPageController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @category = Menu.find(params[:id])
      @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 10)
      @manufacturers = Manufacturer.where(id: @category.get_products_for_categories(params).map(&:manufacturer_id))
      @new_blog_footer = Article.order("created_at DESC").first(3)
      @partners = Partner.order("created_at DESC").first(28)
  end
end
