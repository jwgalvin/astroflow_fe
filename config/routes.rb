Rails.application.routes.draw do

    root "welcome#index"
    get '/auth/google_oauth2/callback', to: 'users#sign_in'
    get '/logout', to: 'users#logout'
    get '/edit', to: 'users#edit'
    post '/register', to: 'users#create'
    patch '/register', to: 'users#update'
    get '/flowchart', to: 'flowchart#index'
    get '/flowchart/new', to: 'flowchart#new'
    post '/flowchart/create', to: 'flowchart#create'
    get '/flowchart/edit', to: 'flowchart#edit'
    get '/sign_up', to: 'users#sign_up'
    get '/dashboard', to: 'users#show'

    resources :login, only: [:index]
    resources :dashboard, only: [:show], controller: :users
    resources :logout, only: [:logout], controller: :users
end
