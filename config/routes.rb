Rails.application.routes.draw do

  get 'user/:user' => 'user#user'

  post 'auth/:gtid' => 'user#auth'

  post 'user/' => 'user#create'

  post 'user/:user_id' => 'user#update'

  post 'user/resetpassword' => 'user#reset_password'

  get 'profile/:user_id' => 'user#profile'

  post 'profile/create/:user_id' => 'user#create_profile'

  post 'profile/:profile_id' => 'user#update_profile'

  get "shoplist/:shoplist_id" => 'shoplist#shoplist'

  post "shoplist/" => 'shoplist#new'

  post "shoplist/:shoplist_id" => 'shoplist#update'

  get "product_item/:product_item_id" => "product_item#product_item"

  post "product_item/" => "product_item#new"

  post "product_item/:product_item_id" => "product_item#update"

  get "product/:product_id" => "product#product"

  post "product/:product_id" => "product#update"

  get "supermarket/:supermarket_id" => "supermarket#supermarket"

  post "supermarket/:supermarket_id" => "supermarket#update"

  get "payment/:payment_id" => "payment#payment"

  post "payment/:payment_id" => "payment#update"

  get "payment_transaction/:payment_transaction_id" => "payment_transaction#payment_transaction"

  post "payment_transaction/:payment_transaction_id" => "payment_transaction#update"

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
