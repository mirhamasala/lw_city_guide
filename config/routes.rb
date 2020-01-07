Rails.application.routes.draw do
  # Automatically search for spots in Google database; two Google APIs used:
  #  Google place autocomplete : https://developers.google.com/places/web-service/autocomplete
  #  Google place details      : https://developers.google.com/places/web-service/details
  post "spot_autocompletes/autocomplete"
  post "spot_autocompletes/place_details"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :spots, only: [:index]
  end
  resources :spots, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :ratings, only: [:create, :update]
    resources :spot_statuses, only: [:update], as: :status
  end
  resources :cities, only: [:new, :create, :edit, :update]
  resources :categories, only: [:new, :create, :edit, :update]
  resource :dashboard, only: [:show], as: :dashboard
  resources :countries, only: [:new, :create]
end
