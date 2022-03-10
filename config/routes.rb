Rails.application.routes.draw do
  devise_for :users
  root 'pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'onboarding', to: 'pages#onboarding', as: :onboarding
  get 'ui-kitt', to: 'pages#ui_kitt'

  resources :users, only: :show

  resources :pets do
    resources :tag_readings, except: [:edit, :update, :destroy]
  end

  resources :notifications, only: [:index]
end
