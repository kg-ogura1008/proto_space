Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes
  resources :comments, only: [:create]
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: :index
end
