Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'documentation#index', as: 'documentation'
  
  namespace :api do
    resources :reservations, only: [:index, :create, :destroy]
    resources :cars, only: [:index, :show, :create, :destroy]
    resources :users, only: [:index, :show, :create]
    post '/login', to: 'authentication#login'
  end

  get '/documentation', to: 'documentation#index'
  get '/documentation/authentication', to: 'documentation#authentication'
  get '/documentation/users', to: 'documentation#users'
  get '/documentation/cars', to: 'documentation#cars'
  get '/documentation/reservations', to: 'documentation#reservations'
end
