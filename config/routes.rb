Rails.application.routes.draw do
  devise_for :users
  root to: "cities#home"

  resources :cities, only: [:show]
  resources :spots, only: [:show, :destroy]
end
