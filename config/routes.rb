Rails.application.routes.draw do


    root "welcome#index"
    get '/auth/google_oauth2/callback', to: 'users#create'
     resources :login, only: [:index]
       resources :register, only: [:index]
      # resources :dashboard, only: [:show], controller: :users
    end
