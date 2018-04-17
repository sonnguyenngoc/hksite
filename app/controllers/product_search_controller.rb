class ProductSearchController < ApplicationController
  def index
    @menus = Menu.get_menus
    @products = Product.search(params).paginate(:page => params[:page], :per_page => 50).order("created_at DESC")
  end
end
