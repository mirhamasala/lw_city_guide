Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "cities#index"

  get "/set_theme", to: "application#set_theme", as: "set_theme"

  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

  # Automatically search for spots in Google database; two Google APIs used:
  # Google place autocomplete : https://developers.google.com/places/web-service/autocomplete
  # Google place details      : https://developers.google.com/places/web-service/details
  post "spot_autocompletes/autocomplete"
  post "spot_autocompletes/place_details"

  resources :cities, only: [:index] do
    resources :spots, only: [:index]
  end
  resources :spots, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :ratings, only: [:create, :update]
    resources :spot_statuses, only: [:update], as: :status
  end
  resources :cities, only: [:new, :create, :edit, :update, :destroy]
  resources :categories, only: [:new, :create, :edit, :update, :destroy]
  resource :dashboard, only: [:show], as: :dashboard
  resources :countries, only: [:new, :create, :edit, :update, :destroy]
end
