class BlogPostController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @blog_post = Article.find(params[:id])
    @related_post = Article.all
    @tag = Tag.order("created_at DESC")
    @new_blog_footer = Article.get_all_articles.first(3)
  end
end
