Rails.application.routes.draw do

  resources :codefellows_courses

  # get 'friendship/create' => 'friendship#create'

  # get 'friendship/destroy' => 'friendship#destroy'
  resources :friendships

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  resources :users do
    member do
      put "star", to: "users#star"
      put "unstar", to: "users#unstar"
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'static_pages/splash' => 'static_pages#splash', as: :splash
  get 'static_pages/intro' => 'static_pages#intro', as: :intro
  get 'static_pages/toolbox' => 'static_pages#toolbox', as: :toolbox
  get 'users/:id/dashboard' => 'users#dashboard', as: :dashboard
  get 'users/:id/history' => 'users#history', as: :history
  get 'static_pages/feedback' => 'static_pages#feedback', as: :feedback
  get 'static_pages/calendar' => 'static_pages#calendar', as: :calendar
  get 'static_pages/view_user_mentee' => 'static_pages#view_user_mentee'
  get 'static_pages/view_user_mentor' => 'static_pages#view_user_mentor'
  # You can have the root of your site routed with "root"

  root 'passthrough#index'

  get '/create_account' => 'user#new'

  get '/create_account' => 'user#new'

  get "/profile_build" => 'haml_views#profile_build'
  get "/intro" => 'haml_views#intro'
  get '/dashboard' => 'haml_views#dashboard'
  get '/new_dash'=> 'haml_views#new_dash'
  get '/toolbox' => 'haml_views#toolbox'
  get 'users/:id/profile_starter' => 'users#profile_starter'
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
