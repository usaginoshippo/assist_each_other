Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  root to: "schedules#index"
  resources :users, only: [:edit, :update, :show ]
  resources :schedules, only: [:index, :create, :show, :edit, :update]
end