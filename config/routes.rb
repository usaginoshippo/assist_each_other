Rails.application.routes.draw do
  devise_for :users
  get 'schedules/select'
  root to: "users#select"
  resources :users, only: [:edit, :update, :show ]do
    collection do
      get 'select'
    end
  end

  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :schedules, only: [:index, :create, :show, :edit, :update, :destroy]
  end
  
end