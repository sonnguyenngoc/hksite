Rails.application.routes.draw do
  root 'home#index'
  get "home_hot_products" => "home#hot_products", as: :home_hot_products
  get "home_stock_inventory" => "home#stock_inventory", as: :home_stock_inventory
  get "home_promotion_banner" => "home#promotion_banner", as: :home_promotion_banner
  get "home_bestselling" => "home#bestselling", as: :home_bestselling
  get "home_listing_brand" => "home#listing_brand", as: :home_listing_brand
  
  get "tim-kiem-san-pham.html" => "product_search#index", as: :product_search
  get "san-pham(/:title)-:id.html" => "product#index", as: :product
  get "chuyen-muc(/:title)-:id.html" => "category_page#index", as: :category
  get "hinh-anh(/:title)(/:id)/(:type)" => "product_images#image", as: :product_image
  get "xem-nhanh.html" => "product#quickview", as: :product_quickview

  get "tin-tuc.html" => "blog#index", as: :blog_listing
  get "tin-tuc(/:title)-:id.html" => "blog#detail", as: :blog_detail  
  get "gioi-thieu.html" => "about_us#index", as: :about_us
  get "lien-he.html" => "contact#index", as: :contact
  get "lien-he/gui-loi-nhan-thanh-cong.html" => "contact#finish_contact", as: :finish_contact

  get "gio-hang.html" => "shopping_cart#index", as: :shopping_cart
  get "dat-hang.html" => "check_out#index", as: :check_out
  get "dat-hang/thanh-cong.html" => "finish_checkout#index", as: :finish_checkout

  get "huong-dan-mua-hang.html" => "information#policy_1", as: :policy_1
  get "huong-dan-thanh-toan.html" => "information#policy_2", as: :policy_2
  get "chinh-sach-van-chuyen-giao-nhan.html" => "information#policy_3", as: :policy_3
  get "chinh-sach-bao-hanh.html" => "information#policy_4", as: :policy_4
  get "chinh-sach-doi-tra-hang-va-hoan-tien.html" => "information#policy_5", as: :policy_5
  get "quy-dinh-bao-mat-thong-tin.html" => "information#policy_6", as: :policy_6
  get "quy-che-hoat-dong-trang-tmdt.html" => "information#policy_7", as: :policy_7
  get "cac-dieu-khoan-va-dieu-kien.html" => "information#policy_8", as: :policy_8
  get "cau-hoi-thuong-gap.html" => "information#policy_9", as: :policy_9

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
