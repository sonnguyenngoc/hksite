class InfomationsController < ApplicationController
  def policy
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @policy = Article.joins(:tag).where(tags: {title: "Chính sách quy định - Điều khoản & điều kiện"}).first(1)
    @new_blog_footer = Article.get_all_articles.first(3)
  end
end
