class ProductController < ApplicationController
  def index
    @company_info = Contact.find(1)
    @category = Category.all.where(level: '1')
    @pro_detail = Product.first
    @message = Message.new
    @company_info = Contact.find(1)
    @product = Product.all
  end
end
