Rails.application.routes.draw do
  resources :categories
  resources :posts do
    collection do
      get :search
    end
  end
  get '/contact', to: 'contact_forms#new', as: 'new_contact_form'
  post '/contact_forms', to: 'contact_forms#create', as: 'contact_forms'

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get '/horoscope', to: 'pages#horoscope'

  # get '/posts/new', to: 'posts#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # config/routes.rb
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:new, :create]
end
