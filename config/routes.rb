Rails.application.routes.draw do
  
  root 'homes#index'
  resources :tasks, only: [:index]
end
