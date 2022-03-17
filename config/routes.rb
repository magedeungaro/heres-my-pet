Rails.application.routes.draw do
  get 'notifications/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#landing'

  get 'onboarding', to: 'pages#onboarding', as: :onboarding
  get 'ui-kitt', to: 'pages#ui_kitt', as: :ui

  devise_for :users

  resources :users, only: :show

  resources :pets do
    resources :tag_readings, except: [:edit, :update, :destroy, :show]
  end

<<<<<<< HEAD
  resources :notifications, only: [:index]

=======
  resources :tag_readings, only: :show

  resources :notifications, only: [:index, :show]
>>>>>>> c7699d6bba67cf646af161c8e5ed03f8642551da
end
