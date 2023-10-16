Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events do
    resources :tickets, only: [:new, :create, :destroy]
  end

  root "events#index"
end
