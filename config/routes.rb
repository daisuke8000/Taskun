Rails.application.routes.draw do
  devise_for :users,controllers: { registrations: 'registrations' }
  root 'homes#index'
  get '/groups' , to: 'groups#index'
  # get 'tasks/new', to: 'tasks#new'
  # get 'tasks/show' , to: 'tasks#show'
  get 'users/member', to: 'users#member'
  resources :tasks
  resources :users
  resources :categories do
    collection do
      get 'search'
    end
  end
end
