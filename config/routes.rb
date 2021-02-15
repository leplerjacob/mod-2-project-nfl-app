Rails.application.routes.draw do
  root 'topics#index'
  resources :coaches, only: [:index, :show]
  resources :venues
  resources :matches
  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end