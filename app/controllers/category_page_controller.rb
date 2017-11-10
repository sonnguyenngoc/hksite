class CategoryPageController < ApplicationController
  def index
      @category = Menu.find(params[:id])
      @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 24)
      @manufacturers = Manufacturer.where(id: @category.get_products_for_categories(params).map(&:manufacturer_id))
  end
end
