Rails.application.routes.draw do
  root to: 'toppages#index'
  post '/', to: 'toppages#search', as: 'search'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :kakins
  resources :games, only: [:index, :new, :create, :edit, :update]
end