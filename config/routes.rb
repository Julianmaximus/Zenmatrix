Rails.application.routes.draw do
  resources :categories
  resources :posts
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  get '/contact', to: 'pages#contact'

  # get '/posts/new', to: 'posts#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users
  resources :users
end
