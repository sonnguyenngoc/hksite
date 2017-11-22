class HomeController < ApplicationController
  def index
    @menus = Menu.get_menus    
  end

  def hot_products
    render layout: nil
  end

  def stock_inventory
    render layout: nil
  end

  def promotion_banner
    render layout: nil
  end

  def bestselling
    render layout: nil
  end

  def listing_brand
    render layout: nil
  end
end
