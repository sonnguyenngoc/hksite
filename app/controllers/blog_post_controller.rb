class BlogPostController < ApplicationController
  def index
    @blog = Article.order("created_at DESC").first(3)
    @blog_post = Article.find(params[:id])
  end
end
