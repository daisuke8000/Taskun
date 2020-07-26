Rails.application.routes.draw do

  devise_for :users
  root 'homes#index'
  resources :users

  get '/tasks', to: 'tasks#show'

  resources :tasks, only: [:index]


end
