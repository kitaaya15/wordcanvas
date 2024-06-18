Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :words, only: [:new, :create, :show]
  resources :users, only: [:show, :edit, :update]
  resources :tweets do
    collection do
      get 'search'
    end
  end
end

