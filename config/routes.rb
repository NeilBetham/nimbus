Rails.application.routes.draw do
  root to: 'home#index'

  resource :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root to: 'status#index'
    resources :stations, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  namespace :api do
    resource :reporting, only:[] do
      post :reading
      post :health
    end
  end
end
