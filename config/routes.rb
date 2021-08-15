Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  resources :users, only: [:show] 

  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
end
