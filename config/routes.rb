Rails.application.routes.draw do
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
  # You can have the root of your site routed with "root"

  root 'passthrough#index'

  get '/create_account' => 'user#new'

  get '/create_account' => 'user#new'
end
