Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :words, only: [:new, :create, :show, :edit, :update]
  resources :users
end
