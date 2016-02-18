class BlogController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @blog = Article.order("created_at DESC")
    @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
