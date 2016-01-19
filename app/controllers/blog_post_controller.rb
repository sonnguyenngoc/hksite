class BlogPostController < ApplicationController
  def index
    @message = Message.new
    @company_info = Contact.find(1)
    @blog = Article.order("created_at DESC").first(3)
    @blog_post = Article.find(params[:id])
  end
end
