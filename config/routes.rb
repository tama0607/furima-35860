Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products, only: [:index,:show,:create,:new,:edit,:update]
end
