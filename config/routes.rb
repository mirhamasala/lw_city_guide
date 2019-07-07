Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cities, only: [:show] do
    resources :spots, only: [:show]
  end
  resources :spots, only: [:destroy]
end
