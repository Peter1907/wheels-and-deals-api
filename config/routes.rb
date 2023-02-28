Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :reservations, only: [:index, :create]

  end
  resources :cars, only: [:index, :show, :create]
  resources :users, only: [:index, :show, :create]
  post '/login', to: 'authentication#login'
end
