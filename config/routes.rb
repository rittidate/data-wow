Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  get '/logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  root to: 'home#index'
end
