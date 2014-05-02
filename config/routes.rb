Rails.application.routes.draw do

  
  get 'doortags/related'
  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'
get "sessions/new"
get "sessions/create"
get "sessions/destroy"
post "sessions/create"
  get 'sessions/login_attempt'
  post 'sessions/login_attempt'
  
get 'users/edit'
  get 'switpost/new'
  post 'switpost/new'
  get 'post/index'
  get 'sessions/new'
  get 'welcome/index'

  get 'users/index'
  get 'users/new'
  root to: 'users#new'

resources :user_sessions
resources :users
resources :post

resources :articles do
  resources :comments, :users, :sweets, :sours, :doortags
end


get '/door_tag' => 'doortags#related'


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
