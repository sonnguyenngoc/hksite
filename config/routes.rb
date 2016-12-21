Rails.application.routes.draw do
  get "san-pham(/:title)-:id.html" => "product#index", as: :detail_products
  get "chuyen-muc(/:title)-:id.html" => "category_page#index", as: :category_list
  
  resources :product_images do
    collection do
      get :image
    end
  end
  devise_for :logins
  resources :customer_orders
  resources :line_items
  resources :carts
  resources :category
  resources :product
  root 'home#index'
  get "blog" => "blog#index", as: :blog
  get "blog_detail" => "blog_detail#index", as: :blog_detail
  get "blog_post" => "blog_post#index", as: :blog_post
  get "contact" => "contact#index", as: :contact
  get "about_us" => "about_us#index", as: :about_us
  get "infomations/policy" => "infomations#policy", as: :policy
  get "shopping_cart" => "shopping_cart#index", as: :shopping_cart
  get "check_out" => "check_out#index", as: :check_out
  get "category_page/:id" => "category_page#index", as: :category_page
  get "manufacturer" => "manufacturer#index", as: :manufacturer
  get "manufacturer_page" => "manufacturer_page#index", as: :manufacturer_page
  get "product_search" => "product_search#index", as: :product_search
  get "all_bestseller_product" => "all_bestseller_product#index", as: :all_bestseller_product
  get "all_hot_product" => "all_hot_product#index", as: :all_hot_product
  get "all_new_product" => "all_new_product#index", as: :all_new_product
  get "all_prominent_product" => "all_prominent_product#index", as: :all_prominent_product
  get "all_sale_product" => "all_sale_product#index", as: :all_sale_product
  get "finish_checkout" => "finish_checkout#index", as: :finish_checkout
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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
