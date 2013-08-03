UniversityRenter::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listings#index'

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
  
  resources :addresses do
    collection do
      get :get_city_and_state
      get :select_state
      get :select_city
    end
  end
  resources :colleges do
    get :select, on: :member
    resources :listings
    resources :communities do
      get :contact, on: :member
      post :send_email, on: :member
    end
  end
  resources :communities do
    collection do
      get :update_dropdown
    end
  end
  
  resources :features
  resources :listings
  resources :sessions
  
  resources :users do
    get :signup, on: :member
    post :finalize_signup, on: :collection
  end
  
  get "logout" => "sessions#destroy", :as => "logout"  
  get "login" => "sessions#new", :as => "login"  
  get "signup" => "users#signup", :as => "signup"  
  
  ### Legacy redirects - Match legacy routes that old static version of UniversityRenter used
  ["ncsu", "ecu", "unc", "uncg", "uncw", "uncc", "asu", "duke"].each do |short_name|
    get "/#{short_name}(/:legacy_community_name(/:community_page))", controller: :application, action: :legacy_redirect, legacy_college_name: short_name
  end

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
