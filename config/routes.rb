Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#landing'

  get 'onboarding', to: 'pages#onboarding'
  get 'ui-kitt', to: 'pages#ui_kitt'

  devise_for :users

  resources :users, only: :show

  resources :pets do
    resources :tag_readings, except: [:edit, :update, :destroy]
  end

  resources :notifications, only: [:index]
end
