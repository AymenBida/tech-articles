Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories, only: [:index]
  resources :articles, except: [:show, :destroy] do
    resources :votes, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
