Rails.application.routes.draw do
  
  get 'welcome/index'

  #get 'login', :to => 'session#new'
  #get 'register', to => 'users#new' 
  resources :users, only: [:create, :update, :show]
  resources :session, only: [:create, :destroy, :update]
  resources :charges

  resources :businesses, only: [:index, :new, :create, :update, :edit, :destroy, :show] do
    resource :design, only: [:new, :create, :update, :show]
  end

  namespace :admin do
    resources :users
    resources :businesses
  end
  
  get 'class_register', to: 'businesses#class', as: :signup
  match '/register_class', to: 'businesses#register_class', via: 'post'
  get 'home', to: 'welcome#index', as: :home
  get 'login', to: 'session#new', as: :login
  get 'register', to: 'users#new', as: :register
  match '/claim_business', to: 'businesses#claim_business', via: 'post'

  root 'welcome#index'

  get '/auth/:provider/callback', :to => 'session#create'
  delete '/logout', to: 'session#destroy'



  get '/businesses/:business_id/design/', to: 'designs#create'
  p '/businesses/:business_id/design/', to: 'designs#create'

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
