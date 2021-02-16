Rails.application.routes.draw do
  
  # Welcome
  get '/home', to: 'welcome#home', as: 'home'
  get '/about', to: 'welcome#about', as: 'about'
  get '/contact', to: 'welcome#contact', as: 'contact'

  # Temp Homepage
  root "sessions#new"
  
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

  # Workouts
  resources :workouts

  # Routines
  resources :routines
  
  delete 'logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end