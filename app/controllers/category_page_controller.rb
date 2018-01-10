class CategoryPageController < ApplicationController
  def index
      @menus = Menu.get_menus
      @category = Menu.find(params[:id])
      @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 24)
      @manufacturers = Manufacturer.where(id: @category.get_products_for_categories(params).map(&:manufacturer_id))
      @title = @category.title
      @meta_keywords = @category.meta_keywords
      @meta_description = @category.meta_description
  end
end
