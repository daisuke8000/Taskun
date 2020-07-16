Rails.application.routes.draw do
  root 'homes#index'
  get '/tasks', to: 'tasks#show'
end
