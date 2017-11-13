class BlogController < ApplicationController
  def index
    @blogs = Article.get_all_articles.paginate(:page => params[:page], :per_page => 10)
  end
  
  def detail
    @blog = Article.find(params[:id])
  end
end
