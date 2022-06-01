Rails.application.routes.draw do
    get 'users/index'
    root 'home#index'
    devise_for :users, controllers: { sessions: "user/sessions"}
    resources :users, only: [:index, :show]
    resources :exercise_routines
    resources :exercises, except: [:destroy]
    resources :friendships, only: [:new, :destroy]
    get 'home/index'
    get 'about', to: 'home#about'

    get '*path' => redirect('/')
end
