class BlogDetailController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @blog = Article.get_article(params).paginate(:page => params[:page], :per_page => 3)
    @find_tag = Tag.find(params[:id])
    @tag = Tag.order("created_at DESC")
    @new_blog_footer = Article.get_all_articles.first(3)
  end
end
