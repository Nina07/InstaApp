Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :users, only: [:show] 
  devise_for :users

  resources :posts, only: [:new, :create]
end
