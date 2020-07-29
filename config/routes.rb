Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  devise_for :users
  root 'homes#index'
  resources :users

  get '/tasks', to: 'tasks#show'

  resources :tasks, only: [:index]


end
