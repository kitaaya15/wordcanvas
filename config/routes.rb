Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :words, only: [:new, :create, :show]
  resources :users
  resources :tweets, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
end
