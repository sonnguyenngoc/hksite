class BlogController < ApplicationController
  def index
    @menus = Menu.get_menus
    @blogs = Article.get_all_articles.paginate(:page => params[:page], :per_page => 10)
    @title = 'Tin công nghệ'
  end
  
  def detail
    @menus = Menu.get_menus
    @blog = Article.find(params[:id])
    @title = @blog.title
  end
end
