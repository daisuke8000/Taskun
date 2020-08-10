Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  devise_for :users
  root 'homes#index'
  resources :users
  get '/tasks' => 'tasks#show'
  get '/groups' => 'groups#show'
  resources :tasks, only: [:index]
  resources :categories
end
