Rails.application.routes.draw do
  get 'users/index'
  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships, only: [:new, :destroy]
  get 'home/index'
  get 'about', to: 'home#about'

  get '*path' => redirect('/')
end
