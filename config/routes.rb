Rails.application.routes.draw do
  root 'topics#index'

  resources :coaches, only: [:index, :show]
  get '/coachpositions', to: 'coaches#position'
  
  resources :venues
  resources :matches
  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  get '/playerpositions', to: 'players#position'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end