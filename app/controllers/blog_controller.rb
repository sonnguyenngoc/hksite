class BlogController < ApplicationController
  def index
    @message = Message.new
    @company_info = Contact.find(1)
    @blog = Article.order("created_at DESC")
  end
end
