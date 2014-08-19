PharmEngine::Application.routes.draw do

  resources :sale_items


  resources :sales


  resources :itemattributes


  resources :items


  resources :item_attribute_details


  get "dashboard/index"
  get "reports/daily_sales"
  get "sessions/index"
  get "sessions/login"
  get "sessions/logout"
  post "sessions/login"
  post "sessions/password_change"

  get "sessions/destroy"

  get "sessions/request_new"

  get "sessions/password_change"

  #Needs to be made cleaner
  get "items/import_spreadsheet"
  get "items/edit"
  get "items/show"
  get "search/search"
  post "search/search"
  get "settings/index"
  get "help/index"
  get "reports/index"
  post "items/import_spreadsheet"

  resources :users


  resources :warehouses


  resources :batches


  resources :backuplogs


  resources :roles


  resources :change_types


  resources :taxcodes


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
  root :to => 'sessions#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
