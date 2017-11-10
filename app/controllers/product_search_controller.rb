class ProductSearchController < ApplicationController
  def index      
      @products = Product.search(params).paginate(:page => params[:page], :per_page => 20).order("name ASC")
  end
end
