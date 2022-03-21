Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#landing'

  get 'onboarding', to: 'pages#onboarding', as: :onboarding
  get 'ui-kitt', to: 'pages#ui_kitt', as: :ui
  get 'privacy-policy', to: 'pages#privacy_policy', as: :privacy_policy
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  devise_for :users

  resources :users, only: :show

  resources :pets do
    resources :tag_readings, except: [:edit, :update, :destroy, :show]
  end

  get 'pets/:id/hero', to: 'pets#hero', as: :hero

  resources :tag_readings, only: :show

  resources :notifications, only: [:index, :show, :destroy] do
    get  :notifications_counter, on: :collection
    post :mark_as_read, on: :collection
    post :mark_as_read, on: :member
    delete :destroy_all, on: :collection
  end
end
