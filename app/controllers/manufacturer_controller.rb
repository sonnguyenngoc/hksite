class ManufacturerController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @partners = Partner.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      @new_blog_footer = Article.get_all_articles.first(3)
  end
end
