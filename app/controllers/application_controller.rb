class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart, only: [:index, :confirm_order, :create]
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  
  def layout_by_resource
    if controller_name == 'home' || controller_name == 'category' || controller_name == 'blog' || controller_name == 'blog_detail' || controller_name == 'blog_post' ||
       controller_name == 'contact' || controller_name == 'about_us' || controller_name == 'shopping_cart' || controller_name == 'manufacturer_page'  || controller_name == 'manufacturer' ||
       controller_name == 'check_out' || controller_name == 'product' || controller_name == 'category_page' || controller_name == 'product_search' ||
       controller_name == 'all_bestseller_product' || controller_name == 'all_hot_product' || controller_name == 'all_new_product' || controller_name == 'all_prominent_product' || controller_name == 'all_sale_product' ||
       controller_name == 'finish_checkout'
          'frontend'
    elsif (devise_controller? && resource_name == :login && action_name != 'edit') || controller_name == 'passwords'
            'login'
    elsif controller_name == 'manages' || controller_name == 'messages' || controller_name == 'newsletters' ||
          controller_name == 'tags' || controller_name == 'articles' || controller_name == 'slide_shows' || controller_name == 'carts' ||
          controller_name == 'menus' || controller_name == 'product_infos' || controller_name == 'customer_orders' || controller_name == 'old_category' || controller_name == 'partners'
              authenticate_login!
              'backend'
    end
  end
end
