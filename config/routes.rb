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
    get 'stats', as: 'stats'
  end
  
  # Players
  resources :players, only: [:index, :show] do
    get 'stats', as: 'stats'
  end
  get '/playerpositions', to: 'players#position'

  # Workouts
  resources :workouts
  get 'routine/workouts', to: 'workouts#bulk_new', as: 'bulk_new'

  # Routines
  resources :routines
  patch 'update/routine', to: 'workouts#update_routine_workouts', as: 'update_routine_workouts'
  
  delete 'logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end