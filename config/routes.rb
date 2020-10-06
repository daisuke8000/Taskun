Rails.application.routes.draw do
  devise_for :users,controllers: { registrations: 'registrations' }
  root 'homes#index'
  get '/groups' , to: 'groups#index'
  get 'users/member', to: 'users#member'
  resources :tasks do
    collection do
      get 'search'
    end
  end
  resources :users
  resources :categories do
    collection do
      get 'search'
    end
  end
end
