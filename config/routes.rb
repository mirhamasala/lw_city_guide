Rails.application.routes.draw do
  devise_for :users
  root to: "cities#home"

  resources :cities, only: [:show] do
    resources :spots, only: [:new, :create]
  end
  resources :spots, only: [:show, :destroy]
end
