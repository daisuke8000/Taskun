Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  devise_for :users
  root 'homes#index'
  resources :users
  resources :tasks, only: [:index]
  post 'categories', to: 'categories#create'
  resources :categories do
    collection do
      get 'search'
    end
  end
end
