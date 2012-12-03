Blog::Application.routes.draw do

  # Path to clear cache, used for deployment hook or to clear cache from the browser
  match Blog::CLEAR_CACHE_PATH => 'pages#clear_cache'

  match 'pages/recent_posts' => 'pages#recent_posts'
  match 'pages/:page' => 'pages#index'

  resources :pages

  resources :sessions
  resources :comments, only: [:create, :destroy]
  
  # Only need to create first user
  resources :users, only: [:show]
  # resources :users

  root :to => 'pages#index'
  
  namespace :admin do
    root to: "pages#index"
    match 'posts' => "pages#index", type: :post
    get 'pages' => "pages#index", type: :page
    resources :pages
    resources :comments
    resources :menus
  end

  match 'login' => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout

  match 'search' => 'pages#search', as: :search

  match 'archives' => 'pages#archives', as: :archives
  match 'feed' => 'pages#index', as: :feed
  match ':slug' => 'pages#show', as: :page

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
