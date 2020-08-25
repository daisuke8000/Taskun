Rails.application.routes.draw do
  get 'tasks/new', to: 'tasks#new'
  devise_for :users
  root 'homes#index'
  resources :users

  get '/tasks', to: 'tasks#show'

  resources :tasks
  resources :categories


end
