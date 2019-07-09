Rails.application.routes.draw do
  devise_for :users
  root to: "cities#index"
  resources :cities, only: [:index, :show] do
    resources :spots, only: [:new, :create]
  end
  resources :spots, only: [:show, :edit, :update, :destroy] do
    resources :ratings, only: [:create, :update]
  end
end
