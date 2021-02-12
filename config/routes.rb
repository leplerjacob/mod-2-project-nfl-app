Rails.application.routes.draw do
  resources :coaches
  resources :stadia
  resources :matches
  resources :teams
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end