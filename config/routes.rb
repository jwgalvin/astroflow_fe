Rails.application.routes.draw do


    root "welcome#index"
      resources :login, only: [:index]
      resources :register, only: [:index]
      resources :dashboard, only: [:show], controller: :users
  
    end
