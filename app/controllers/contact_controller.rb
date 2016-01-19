class ContactController < ApplicationController
  def index
    @newsletter = Newsletter.new
    @message = Message.new
    @company_info = Contact.find(1)
    @blog = Article.order("created_at DESC").first(3)
  end
end
