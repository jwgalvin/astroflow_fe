Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    root "welcome#index"
      # resources :login, only: [:show]
      # resources :register, only: [:new, :create], controller: :users
      # resources :dashboard, only: [:show], controller: :users
    end
