class BlogController < ApplicationController
  def index
    @blog = Article.order("created_at DESC")
  end
end
