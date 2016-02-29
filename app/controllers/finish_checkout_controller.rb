class FinishCheckoutController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @new_blog_footer = Article.get_all_articles.first(3)
  end
end
