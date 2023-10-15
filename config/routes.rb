Rails.application.routes.draw do
  resources :tickets
  devise_for :users
  resources :events
  resources :users

  root 'events#index'
end
