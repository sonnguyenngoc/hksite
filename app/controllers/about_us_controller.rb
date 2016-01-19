class AboutUsController < ApplicationController
  def index
    @message = Message.new
    @company_info = Contact.find(1)
  end
end
