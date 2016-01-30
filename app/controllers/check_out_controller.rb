class CheckOutController < ApplicationController
  def index
    @customer_order = CustomerOrder.new
    @menu = Menu.all
    @message = Message.new
    @company_info = Contact.find(1)
  end
end
