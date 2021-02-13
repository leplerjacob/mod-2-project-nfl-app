Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  resources :coaches
  resources :venues
  resources :matches
  resources :teams
  resources :players


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end