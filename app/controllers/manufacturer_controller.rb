class ManufacturerController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @partners = Partner.all
      @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
