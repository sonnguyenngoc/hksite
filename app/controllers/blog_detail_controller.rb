class BlogDetailController < ApplicationController
  def index    
    @blog = Article.get_article(params).paginate(:page => params[:page], :per_page => 3)
    @find_tag = Tag.find(params[:id])
    @tag = Tag.order("created_at DESC")
    @new_blog_footer = Article.get_all_articles.first(3)
  end
end
