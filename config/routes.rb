Rails.application.routes.draw do
  
  # Temp Homepage
  root 'topics#index'

  # Coaches
  resources :coaches, only: [:index, :show]
  get '/coachpositions', to: 'coaches#position'
  
  # Venues
  resources :venues
  
  # Matches
  resources :matches
  
  # Users
  resources :users

  # Sessions
  get 'login', to: 'sessions#new', as: 'user_login'
  post 'login', to: 'sessions#create', as: 'login'
  
  # Teams
  resources :teams, only: [:index, :show]

  # Players
  resources :players, only: [:index, :show]
  get '/playerpositions', to: 'players#position'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end