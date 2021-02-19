Rails.application.routes.draw do
  
  # Temp Homepage
  root "sessions#new"
  
  # Coaches
  resources :coaches, only: [:index, :show]
  get '/coachpositions', to: 'coaches#position'
  
  # Venues
  resources :venues, only: [:index, :show]
  
  # Matches
  resources :matches, only: [:index, :show]
  
  # Users
  resources :users
  
  # Sessions
  get 'login', to: 'sessions#new', as: 'user_login'
  post 'login', to: 'sessions#create', as: 'login'
  
  # Teams
  resources :teams, only: [:index, :show] do
    get 'stats', as: 'stats';
    get 'games', as: 'games'
  end
  
  # Players
  resources :players, only: [:index, :show] do
    get 'stats', as: 'stats'
  end
  get '/playerpositions', to: 'players#position'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end