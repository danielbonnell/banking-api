Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :put, :index]
  resources :accounts, only: [:index, :show]
end
