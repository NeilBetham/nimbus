Rails.application.routes.draw do
  root to: 'home#index'

  resource :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root to: 'status#index'
    resources :stations, only: [:index, :new, :edit, :create, :update, :destroy] do
      resources :tokens, only: [:create, :destroy]
    end
  end

  namespace :api do
    resources :stations, only:[] do
      post :reading
      post :health
    end
  end

  match 'api/*_', via: [:options], to: 'api#options_stub'
end
