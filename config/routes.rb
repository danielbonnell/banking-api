Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:index, :show, :new, :edit, :create, :update]
  resources :accounts, only: [:index, :show]
end
