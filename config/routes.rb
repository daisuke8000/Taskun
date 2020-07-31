Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  devise_for :users
  root 'homes#index'
  resources :users
  resources :tasks, only: [:index]
  resources :categories

end
