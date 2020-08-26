Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  devise_for :users,controllers: { registrations: 'registrations' }
  root 'homes#index'
  resources :users
  get '/tasks' , to: 'tasks#show'
  get '/groups' , to: 'groups#index'
  resources :tasks, only: [:index]
  resources :categories
end
