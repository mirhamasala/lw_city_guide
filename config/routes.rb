Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      # registrations: :registrations
    }
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :spots, only: [:index, :new, :create]
  end
  resources :spots, only: [:show, :edit, :update, :destroy] do
    resources :ratings, only: [:create, :update]
    resources :spot_statuses, only: [:update], as: :status
  end
  resources :cities, only: [:new, :create, :edit, :update]
  resources :categories, only: [:new, :create]
  resource :dashboard, only: [:show], as: :dashboard
end
