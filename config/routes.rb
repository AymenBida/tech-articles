Rails.application.routes.draw do
  root 'sessions#login'
  get 'sessions/login'
  get 'sessions/logout'
  resources :categories
  resources :votes
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
