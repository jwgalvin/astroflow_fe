Rails.application.routes.draw do


    root "welcome#index"
    get '/auth/google_oauth2/callback', to: 'users#create'
    get '/logout', to: 'users#logout'
    get '/register', to: 'users#edit'
    patch '/register', to: 'users#update'
    resources :login, only: [:index]
    #resources :register, only: [:new, :edit]
    resources :dashboard, only: [:index], controller: :users
    resources :logout, only: [:logout], controller: :users
    end
