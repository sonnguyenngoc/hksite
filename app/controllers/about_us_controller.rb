class AboutUsController < ApplicationController
  def index
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
    @about_us = Article.joins(:tag).where(tags: {title: "Giới thiệu công ty"}).first(1)
    @new_blog_footer = Article.order("created_at DESC").first(3)
  end
end
