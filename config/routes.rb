Rails.application.routes.draw do
  get 'schedules/select'
  devise_for :users
  root to: "users#select"
  resources :users, only: [:edit, :update, :show ]do
    collection do
      get 'select'
    end
  end

  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :schedules 
  end
  
end