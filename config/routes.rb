Rails.application.routes.draw do

root  'procedures#search'
 
 devise_for :users

  resources :clinics
  resources :procedures

  match '/allc',  to: 'clinics#allc',   via: 'get'
  match '/clinics',  to: 'clinics#index',   via: 'get'
  match '/clinic/:id',  to: 'clinic#show',   via: 'get'
  match '/users/',  to: 'users#index',   via: 'get'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
  match 'procedures/:id' => 'procedures#destroy', :via => :delete, :as => :destroy_procedure
  match '/searchp/',  to: 'procedures#searchp',   via: 'get'
  
  post 'procedures/:id' => 'procedures#show'
  
  get '/static_pages/get_proc_for_select', to: 'static_pages#get_proc_for_select', as: :get_proc_for_select
  get '/static_pages/get_adr_for_select', to: 'static_pages#get_adr_for_select', as: :get_adr_for_select
  


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
