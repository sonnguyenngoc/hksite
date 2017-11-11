Rails.application.routes.draw do
  root 'home#index'

  get "tim-kiem-san-pham" => "product_search#index", as: :product_search
  get "san-pham(/:title)-:id.html" => "product#index", as: :product
  get "chuyen-muc(/:title)-:id.html" => "category_page#index", as: :category
  get "hinh-anh(/:title)(/:id)/(:type)" => "product_images#image", as: :product_image

  get "tin-tuc.html" => "blog#index", as: :blog_listing
  get "tin-tuc/chi-tiet.html" => "blog_detail#index", as: :blog_detail
  get "blog_post" => "blog_post#index", as: :blog_post

  get "lien-he.html" => "contact#index", as: :contact
  get "gioi-thieu.html" => "about_us#index", as: :about_us

  get "gio-hang.html" => "shopping_cart#index", as: :shopping_cart
  get "dat-hang.html" => "check_out#index", as: :check_out
  get "dat-hang/thanh-cong.html" => "finish_checkout#index", as: :finish_checkout

  get "infomations/policy" => "infomations#policy", as: :policy
  get "manufacturer" => "manufacturer#index", as: :manufacturer
  get "manufacturer_page" => "manufacturer_page#index", as: :manufacturer_page

  get "all_bestseller_product" => "all_bestseller_product#index", as: :all_bestseller_product
  get "all_hot_product" => "all_hot_product#index", as: :all_hot_product
  get "all_new_product" => "all_new_product#index", as: :all_new_product
  get "all_prominent_product" => "all_prominent_product#index", as: :all_prominent_product
  get "all_sale_product" => "all_sale_product#index", as: :all_sale_product

  #@todo online store
	get "autosearch" => "product#autosearch", as: :autosearch

  devise_for :logins
  resources :customer_orders
  resources :line_items
  resources :carts
  resources :category
  resources :product

  namespace :admin, :path => "hoangkhangincotech" do
      resources :partners
      resources :articles
      resources :tags
      resources :slide_shows
      resources :newsletters
      resources :messages
      resources :manages
      resources :menus
      resources :customer_orders
      resources :product_infos
      get "old_category" => "old_category#index", as: :old_category
  end
end
