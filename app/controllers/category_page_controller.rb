class CategoryPageController < ApplicationController
  def index
      @menu = Menu.all
      @message = Message.new
      @company_info = Contact.find(1)
      @category = Menu.find(params[:id])
  end
end
