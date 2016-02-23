class Admin::OldCategoryController < ApplicationController
  def index
    @categories = Category.all
  end
end
