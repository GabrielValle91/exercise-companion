Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'home/index'
  get 'about', to: 'home#about'

  get '*path' => redirect('/')
end
