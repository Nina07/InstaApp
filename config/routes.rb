Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :users, only: [:show] 
  devise_for :users

  resources :posts do
    resources :comments
  end
end
