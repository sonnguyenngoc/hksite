Rails.application.routes.draw do
  resources :customer_orders
  resources :line_items
  resources :carts
  resources :category
  resources :product
  root 'home#index'
  get "blog" => "blog#index", as: :blog
  get "blog_post" => "blog_post#index", as: :blog_post
  get "contact" => "contact#index", as: :contact
  get "about_us" => "about_us#index", as: :about_us
  get "shopping_cart" => "shopping_cart#index", as: :shopping_cart
  get "check_out" => "check_out#index", as: :check_out
  get "category_page" => "category_page#index", as: :category_page
  namespace :admin, :path => "hoangkhangincotech" do
      resources :articles
      resources :tags
      resources :slide_shows
      resources :newsletters
      resources :messages
      resources :manages
      resources :menus
      resources :customer_orders
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
