Rails.application.routes.draw do
  resources :coaches
  resources :venues
  resources :matches
  resources :teams
  resources :players
  resources :users

  get 'login', to: 'sessions#new', as: 'user_login'
  post 'login', to: 'sessions#create', as: 'login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end